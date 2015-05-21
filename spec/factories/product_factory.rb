FactoryGirl.define do
  factory :product do
    title       'Ruby book'
    description 'this is a ruby book'
    price       12.99
    published   true

    association :category
    
    #before(:create) do |product|
    #  product.category = create(:category)
    #end

    #sequence(:email) {|n| "user-#(n)@example.com"}
  end
end
