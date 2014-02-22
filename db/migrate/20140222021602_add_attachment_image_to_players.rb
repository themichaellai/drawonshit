class AddAttachmentImageToPlayers < ActiveRecord::Migration
  def self.up
    change_table :players do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :players, :image
  end
end
