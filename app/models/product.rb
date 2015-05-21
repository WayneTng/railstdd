class Product < ActiveRecord::Base
  belongs_to :category
  validates :title, :description,  presence: true
  validates_numericality_of :price, greater_than: 0
end
