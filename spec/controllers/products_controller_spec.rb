require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  
  describe '#index' do 
    let!(:products) { create_list(:product, 2) }

    it 'get a list of products controller' do
      get :index
      expect(assigns(:products).size).to eq products.size 
    end
  end

  describe '#show' do
    let!(:product) { create(:product) }
    it 'get a product for show' do
      get :show, id: product
      expect(assigns(:product).id).to eq product.id
    end
  end

  describe '#new' do
    it 'assigns an empty product instance' do
      get :new
      expect(assigns(:product)).to be_a Product
    end
  end

  describe '#edit' do
    let!(:product) { create(:product) }
    it 'get the product information for edit' do
      get :edit, id: product
      expect(assigns(:product).id).to eq product.id
    end
  end

  describe '#create' do
    def do_request
      post :create, product: params
    end

    context 'success' do
      let(:params) { attributes_for(:product, category_id: create(category)) }
      
      it 'saves a product' do
        expect { do_request }.to change(Product, :count).by(1)
      end

      it 'redirects to index on success' do
        do_request
        expect(response).to redirect_to products_url
      end
    end

    context 'failure' do
      let(:params){ attributes_for(:product, title: '')}

      it 'renders new on failure' do
        do_request
        expect(response).to render_template :new
      end
    end
  end
end
