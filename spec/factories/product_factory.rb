FactoryGirl.define do
  factory :product do
    title       'Ruby book'
    description 'this is a ruby book'
    price       12.99
    published   true

    before(:create) do |product|
      product.category = create(:category)
    end
  end
end
