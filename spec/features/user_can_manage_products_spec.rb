require 'rails_helper'

RSpec.describe 'User can manage products', type: :feature do
 
  describe 'create a product' do
    let!(:product) { build(:product) }
    let!(:category_title) { product.category.title }
    it 'can create a product' do
      visit '/products'
      expect(page).not_to have_content product.title
      
      click_on 'Create a product'
      fill_in 'Title',        with: product.title
      fill_in 'Description',  with: product.description
      fill_in 'Price',        with: product.price
      select  category_title, from: 'Category'
      click_on 'Create Product'
      expect(page).to have_content product.title.downcase
    end
  end

  describe 'edit a product' do
    let!(:product){ create(:product) }
    it 'can edit a product' do
      visit '/products'
      expect(page).to have_content product.title

      click_on 'Edit'
      fill_in 'Title', with: 'Java Book'
      click_on 'Update Product'
      ap page.body
      expect(find_field('Title').value).to have_content 'java book'
    end
  end
end
