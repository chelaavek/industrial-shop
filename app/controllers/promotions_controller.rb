class PromotionsController < InheritedResources::Base

  def index
    @promotions = Promotion.all
  end

  def show
    @promotion=Promotion.find(params[:id])
  end


  def new
    @promotion = Promotion.new
  end


  def edit
  end


  def create
    @promotion = Promotion.new(promotion_params)

    respond_to do |format|
      if @promotion.save
        format.html { redirect_to @promotion, notice: 'Promotion was successfully created.' }
        format.json { render :show, status: :created, location: @promotion }
      else
        format.html { render :new }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @product.update(promotion_params)
        format.html { redirect_to @promotion, notice: 'Promotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotion_url, notice: 'Promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def promotion_params
    params.permit(:title, :promotion_terms)
  end

end
