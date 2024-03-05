class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|

      #7 Away from convention = fan_id = define the table foreign_key should point to when fan_id is used -> user table and its id. 
      t.references :fan, null: false, foreign_key: {to_table: :users}
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
