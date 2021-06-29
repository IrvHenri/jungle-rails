require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature , js: true  do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "user can add product to cart and it will increase by one" do
    # ACT
    visit root_path

    # click_on 'Details'
    click_button(class: 'btn-primary', :match => :first)
    save_screenshot ('test3.png')
    expect(page).to have_content("My Cart (1)")
    
  end
end
