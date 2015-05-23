class Product < ActiveRecord::Base
  belongs_to :category

  has_attached_file :image, styles: {medium: "300x300", thumb: "100x100"}
                           #default_url: "images/missing.png"

  before_validation :strip_html_from_description
  before_validation :make_title_lowercase

  validates :title, :description, :category, :price, presence: true
  validates_numericality_of :price, greater_than: 0
  validate :strip_html_from_description 
  validate :title_shorter_than_description
  #validates_attachment :image, content_type: {content_type: ["image/jpg", "image/gif", "image/png"]},
  #validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: ["image/jpg",
                                                           "image/png", 
                                                           "image/jpeg", 
                                                           "image/gif", 
                                                           "image/pjpeg", 
                                                           "image/x-png"]
  validates_attachment_size :image, in: 0..3.megabytes, message: "file size cannot be larger than 3MB"

  def strip_html_from_description
    self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
  end

  def make_title_lowercase
    self.title = self.title.downcase if self.title.present?
  end

  def title_shorter_than_description
    return if title.blank? or description.blank?
    if description.length < title.length
      errors.add(:description, "can't be shorter than title")
    end
  end
end

