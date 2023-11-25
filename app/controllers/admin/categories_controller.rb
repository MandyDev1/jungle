class Admin::CategoriesController < ApplicationController
  def index
    # @products = Product.order(id: :desc).all
    @categories = Category.order(id: :desc).all
  end

  def new
    # @product = Product.new
    @category = Category.new
  end

  def create
    # @product = Product.new(product_params)

    # if @product.save
    #   redirect_to [:admin, :products], notice: 'Product created!'
    # else
    #   render :new
    # end

    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end
end
