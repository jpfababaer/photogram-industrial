class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      #1 -> comment.rb
      t.references :author, null: false, foreign_key: {to_table: :users}, index: false
      t.references :photo, null: false, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
