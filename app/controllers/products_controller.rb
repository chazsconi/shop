class ProductsController < ApplicationController

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end


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

  # GET /categories/1/products/1
  # GET /categories/1/products/1.json
  def show
    #@category = Category.find(params[:category_id])
    logger.info("Products/show")
    @product = Product.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to category_path(@category)
  end

end
