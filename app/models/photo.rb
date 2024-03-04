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
  #10 counter_cache -> user.rb
  belongs_to :owner, class_name: "User", counter_cache: true
  #4 -> follow_request.rb
  has_many :comments
  #15 from Like
  has_many :likes
  #16 Like model has fan_id -> user.rb
  has_many :fans, through: :likes,
end
