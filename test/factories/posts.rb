FactoryGirl.define do
  factory :post do
    title   'Pedido de Adopcion'
    body    { Faker::Lorem.paragraphs(2).to_s }
    address 'foo' 
  end
end
