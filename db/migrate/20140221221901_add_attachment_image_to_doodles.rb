class AddAttachmentImageToDoodles < ActiveRecord::Migration
  def self.up
    change_table :doodles do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :doodles, :image
  end
end
