class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      #5 :author and :photo does NOT need index: true EXPLICITLY. Rails knows to do it automatically because these are foreign keys. We explicitly do "index: false" for :author because we do NOT necessarily just want to search all the comments an author makes. (Other social medias do NOT have this feature - useless) = turn off.
      t.references :author, null: false, foreign_key: {to_table: :users}, index: false
      t.references :photo, null: false, foreign_key: true
      #5 include "null: false" as extra validation because we do NOT want an empty comment.
      t.text :body, null: false

      t.timestamps
    end
  end
end
