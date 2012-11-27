class ProductsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.create(params[:product])

    @product.tag_ids = Tag.find(params[:tag_ids]) if params[:tag_ids]

    if @product.save
      redirect_to category_path(@category), :notice => 'Product was successfully created.'
    else
      logger.info("Validation failed on new product")
      render 'categories/show'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to category_path(@category)
  end

end
