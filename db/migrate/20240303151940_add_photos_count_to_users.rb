class AddPhotosCountToUsers < ActiveRecord::Migration[7.0]
  def change
    #9 Add the default value 0. The rest is defined by the migration command: rails g migration AddPhotosCountToUsers photos_count:integer
    add_column :users, :photos_count, :integer, default: 0
  end
end
