# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  comments_count         :integer          default(0)
#  email                  :citext           default(""), not null
#  encrypted_password     :string           default(""), not null
#  likes_count            :integer          default(0)
#  photos_count           :integer          default(0)
#  private                :boolean          default(TRUE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :citext
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #4 Updating the counter-part has_many to create the DIRECT ASSOCIATION. Do not forget to update the migration file _create_photos.rb
  #10 has_many counter_part from Photos
  has_many :own_photos, class_name: "Photo", foreign_key: "owner_id"

  #5 Away from convention = must specify "author_id" because the name of the table we're working on is Users.
  #10 has_many counter_part from Comment
  has_many :comments, foreign_key: "author_id"

  #10 has_many counter_part from Likes belong_to
  has_many :likes, foreign_key: "fan_id"
  #12 the other side of the N-N relationship. There are MANY photos that One user likes. This has_many DIRECTLY associates with the table Like's belongs_to :photo and this belongs_to DIRECTLY associates with the table Photo's has_many :likes. Therefore, we establish an INDIRECT association from User to Photos.
  has_many :liked_photos, through: :likes, source: :photo

  #FollowRequest Model:
  #10 has_many counter_part from FollowRequest
  has_many :sent_follow_requests, class_name: "FollowRequest", foreign_key: "sender_id"
  has_many :accepted_sent_follow_requests, -> { accepted }, foreign_key: :sender_id, class_name: "FollowRequest"
  #10 has_many counter_part from FollowRequest
  has_many :received_follow_requests, class_name: "FollowRequest", foreign_key: "recipient_id"
  has_many :accepted_received_follow_requests, -> { accepted }, foreign_key: :recipient_id, class_name: "FollowRequest"

  #FollowRequest -> leaders + followers
  #13 To get Person A's active following list, we need to use through/source via the User's SCOPED OUT :accepted_sent_follow_requests to only get Users (B,C,D,E..) that ACCEPTED the follow request.
  has_many :leaders, through: :accepted_sent_follow_requests, source: :recipient
  has_many :followers, through: :accepted_received_follow_requests, source: :sender

  #FollowRequest -> direct feed (via leaders' own) + indirect feed (via leaders' liked)
  has_many :feed, through: :leaders, source: :own_photos
  has_many :discover, through: :leaders, source: :liked_photos

  #Validations:
  validates :username, presence: true, uniqueness: true
end
