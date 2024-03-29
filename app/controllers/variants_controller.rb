class VariantsController < ApplicationController
  # GET /products/1/variants
  # GET /products/1/variants.json
  def index
    @variants = Variant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @variants }
    end
  end

  # GET /variants/1
  # GET /variants/1.json
  def show
    @variant = Variant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @variant }
    end
  end

  # GET /variants/new
  # GET /variants/new.json
  def new
    
    @product = Product.find(params[:product_id])
    @variant = @product.variants.build

    
    #@variant = Variant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @variant }
    end
  end

  # GET /variants/1/edit
  def edit
    @variant = Variant.find(params[:id])
  end
 
 
  # POST /variants
  # POST /variants.json
  def create

    @product = Product.find(params[:product_id])
    @variant = @product.variants.create(params[:variant])

    respond_to do |format|
      if @variant.save
        format.html { redirect_to product_variant_path(@variant.product, @variant), :notice => 'Variant was successfully created.' }
        format.json { render json: @variant, status: :created, location: @variant }
      else
        logger.info("Validation failed on new variant")

        format.html { render action: "new" }
        format.json { render json: @variant.errors, status: :unprocessable_entity }

      end

    end

  end

  #Adds variants to the product
  def add
     logger.info("Calling ADD")
     @product = Product.find(params[:product_id])
     
     params[:variant_option_values].each do |vov|
        variant = @product.variants.create(:code=>vov)
        variant.save  
     end          
     redirect_to product_path(@product)
  end


  # PUT /variants/1
  # PUT /variants/1.json
  def update
    @variant = Variant.find(params[:id])

    respond_to do |format|
      if @variant.update_attributes(params[:variant])
        logger.info("Updating variant")
        format.html { redirect_to product_variant_path(@variant.product, @variant), :notice => 'Variant was successfully updated.' }
        format.json { head :no_content }
      else
        logger.info("Updating failed")
        format.html { render action: "edit" }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1
  # DELETE /variants/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @variant = Variant.find(params[:id])
    @variant.destroy

    respond_to do |format|
      format.html {redirect_to product_path(@product)}
      format.json { head :no_content }
    end
  end
end
