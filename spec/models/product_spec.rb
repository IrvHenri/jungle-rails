require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "saves product successfully if all four fields are set" do
      @category = Category.new(name: 'bathroom')
      @product = Product.new(name: "loofa", price: 400, quantity: 5, category: @category)
      @product.save!
      expect(@product).to be_valid
    end

    it "returns an error if product name field is empty " do
      @category = Category.create(name: 'bathroom')
      @product = Product.create(name: nil, price: 400, quantity: 5, category: @category)
       expect(@product.errors.full_messages[0]).to eq "Name can't be blank"
    end

    it "returns an error if product price field is empty " do
      @category = Category.create(name: 'bathroom')
      @product = Product.create(name: 'Chair', price: nil, quantity: 5, category: @category)
       expect(@product.errors.full_messages[0]).to eq "Price cents is not a number"
    end
    it "returns an error if product quantity field is empty " do
      @category = Category.create(name: 'bathroom')
      @product = Product.create(name: "seat", price: 400, quantity: nil, category: @category)
       expect(@product.errors.full_messages[0]).to eq "Quantity can't be blank"
    end

    it "returns an error if product category field is empty " do
      @category = Category.create(name: 'bathroom')
      @product = Product.create(name: "seat", price: 400, quantity: 4, category: nil)
       expect(@product.errors.full_messages[0]).to eq "Category can't be blank"
    end
    
  end
end
