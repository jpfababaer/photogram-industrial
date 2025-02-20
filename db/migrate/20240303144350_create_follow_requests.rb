class CreateFollowRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :follow_requests do |t|
      #6 -> _create_likes.rb 
      t.references :recipient, null: false, foreign_key: {to_table: :users}
      t.references :sender, null: false, foreign_key: {to_table: :users}
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
