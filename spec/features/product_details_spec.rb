require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature , js: true  do
  # SETUP
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

  scenario "They see all products then click on a product to navigate to the product page" do
    # ACT
    visit root_path

    # click_on 'Details'
    first(:link, "Details").click
    save_screenshot ('test2_product_page.png')
    expect(page).to have_css '.product-detail'
    puts page.html
  end
end
