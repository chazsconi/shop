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


  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    
    @possible_variants = []

    #Create a list of lists for the options
    vot_list = []    
    @product.variant_option_types.each do |vot|
        votv_list = []
        vot.variant_option_type_values.each do |votv|
            votv_list << votv.name
        end
        vot_list << votv_list
    end


 #Create the cross join of all possibilities
    if !vot_list.empty?
      all_variants = vot_list[0].product(*vot_list[1..-1])

      all_variants.each do |v|
        @possible_variants << {:vos=>v, :code=> v*"/"}
      end

    end

    logger.debug "possible_variants="+@possible_variants.to_s          
         
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end



  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end


  # PUT /products/1
  # PUT /products/1.json
  def update
    #if no tags are passed, set to an empty array
    params[:product][:tag_ids] ||= []
    params[:product][:variant_option_type_ids] ||= []
    
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        logger.info("Updating tag_ids="+params[:tag_ids].to_s)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy  

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  

end
