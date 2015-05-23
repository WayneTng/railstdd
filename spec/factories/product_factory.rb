FactoryGirl.define do
  factory :product do
    title       'Ruby book'
    description 'this is a ruby book'
    price       12.99
    published   true

    association :category
    image_file_name    'test.jpg'
    image_content_type 'image/jpg'
    image_file_size    1024
    image_updated_at   {DateTime.now} 
   
    #before(:create) do |product|
    #  product.category = create(:category)
    #end

    #sequence(:email) {|n| "user-#(n)@example.com"}
  end

 # factory :image do
 #   photo_file_name    'test.jpg'
 #   photo_content_type 'image/jpg'
 #   photo_file_size    1024
 #   photo_updated_at   {DateTime.now} 
 #   caption            'testing caption'
 # end 
end
