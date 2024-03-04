class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :image

      #4 Add default values for these integer columns.
      t.integer :comments_count, default: 0
      t.integer :likes_count, default: 0
      t.text :caption

      #4 Instead of datatype integer, we use references here which will ultimately still store integer in the column. Null = false because we need to refer to an owner for each photo. Owner is already index by default by Rails. After updating the has_many and belongs_to, update the foreign key option so ":owner" knows to point to the Users table because we went out of convention.
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
