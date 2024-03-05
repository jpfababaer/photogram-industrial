# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  caption        :text
#  comments_count :integer          default(0)
#  image          :string
#  likes_count    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :bigint           not null
#
# Indexes
#
#  index_photos_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Photo < ApplicationRecord
  #4 specify the class_name because we went out of convention + update the partnering has_many
  #9 same reasoning for why to use counter_cache. MAKE sure there is a column APPROPRIATELY named "photos_count" in table User.
  belongs_to :owner, class_name: "User", counter_cache: true

  #5 With convention = short-hand it. For a Photo instance, claim the comments via "photo_id"
  #10 has_many counter_part from Comments
  has_many :comments
  #10 has_many counter_part from Likes
  has_many :likes

  
  has_many :fans, through: :likes

  #Validations:
  validates :caption, presence: true
  validates :image, presence: true

  scope :past_week, -> {where(created_at: 1.week.ago...)}
  scope :by_likes, -> {order(likes_count: :desc)}
end
