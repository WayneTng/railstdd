class Product < ActiveRecord::Base
  belongs_to :category
  
  before_validation :strip_html_from_description
  before_validation :make_title_lowercase

  validates :title, :description, :category, :price, presence: true
  validates_numericality_of :price, greater_than: 0
  validate :strip_html_from_description 

  def strip_html_from_description
    self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
  end

  def make_title_lowercase
    self.title = self.title.downcase if self.title.present?
  end
end
