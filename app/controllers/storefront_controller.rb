class StorefrontController < ApplicationController

	
  def user_name
  end

  def all_items
  	@products = Product.all
  end

  def items_by_category
  end

  def items_by_brand
  end
end
