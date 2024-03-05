# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  photo_id   :bigint           not null
#
# Indexes
#
#  index_comments_on_photo_id  (photo_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (photo_id => photos.id)
#
class Comment < ApplicationRecord
  #5 Away from convention = specify the name of the table we want to refer to = 'class_name: "User" '
  #9 We want to update the author with the count of the comments when a comment is created = add counter_cache: true. Make sure that the table being referred (i.e. User) has a column SPECIFICALLY named "comments_count" for the counter_cache to work. Do the same for :photo (update the # of comments in a photo).
  belongs_to :author, class_name: "User", counter_cache: true
  #5 With convention = just short-hand to :photo
  belongs_to :photo, counter_cache: true

  validates :body, presence: true
end
