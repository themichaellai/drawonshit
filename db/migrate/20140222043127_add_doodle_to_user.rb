class AddDoodleToUser < ActiveRecord::Migration
  def change
    add_column :doodles, :user_id, :integer
  end
end
