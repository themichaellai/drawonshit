class CreateDoodles < ActiveRecord::Migration
  def change
    create_table :doodles do |t|
      t.integer :votes
      t.string :text

      t.timestamps
    end
  end
end
