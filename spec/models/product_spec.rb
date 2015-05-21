require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:category) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

  context 'Association' do
    it { should belong_to(:category) }
  end

  describe '#strip_html_from_description before validating' do
    let!(:product){Product.new(description: '<p>ruby book</p>')} 
    it 'should not contain html tag in description before validating' do
      product.validate
      expect(product.description).to eq 'ruby book'
    end
  end

  describe '#make_title_lowercase' do
    let!(:product){Product.new(title: 'RUBY')}

    it 'should make the title lower case before validating' do
      product.validate
    expect(product.title).to eq 'ruby'
    end
  end
end
