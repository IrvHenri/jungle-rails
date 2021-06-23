class Admin::DashboardController < ApplicationController
  def show
    @products_count = Product.all.count
    @categories_count = Category.all.count
  end
end
