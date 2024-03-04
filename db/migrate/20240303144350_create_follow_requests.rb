class CreateFollowRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :follow_requests do |t|

      #6 Away from convention (i.e. recipient and sender ID) = specify that the foreign key must point to table users using "to_table". Should also set "default" of column status to "pending". In the future, this could be "accepted" or "rejected".
      t.references :recipient, null: false, foreign_key: {to_table: :users}
      t.references :sender, null: false, foreign_key: {to_table: :users}
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
