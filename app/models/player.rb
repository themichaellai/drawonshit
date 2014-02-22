class Player < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name, :slug, :image
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  friendly_id :name, use: :slugged

  def local_image_url
    "/imgs/#{self.slug}.jpg"
  end
end
