require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:category) {Category.new(title: 'Ruby Programming')}
  
  describe '#index' do 
    let!(:products) do
      products = []
      products << Product.create!(title: 'ruby', description: 'Ruby book', price: 12.99, category: category)
      products << Product.create!(title: 'ruby', description: 'Ruby book', price: 12.99, category: category)
    end

    it 'get a list of products controller' do
      get :index
      expect(assigns(:products).size).to eq products.size 
    end
  end

  describe '#show' do
    let!(:product) {Product.create!(title: 'ruby', description: 'Ruby book', price: 12.99, category: category)}
    it 'get a list of product for show' do
      get :show, id: product
      expect(assigns(:product).id).to eq product.id
    end
  end
end
