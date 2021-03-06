class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
    @brews = Brew.all
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to purchase_path(@purchase)
    else
      @brews = Brew.all
      render :new
    end
  end

  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])

  end

  private
  def purchase_params
    params.require(:purchase).permit(:customer_name, :price, :brew_id)
  end
end
