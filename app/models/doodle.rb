class Doodle < ActiveRecord::Base
  attr_accessible :text, :votes, :image
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
