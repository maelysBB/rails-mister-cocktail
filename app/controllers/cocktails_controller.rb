class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :destroy]

  def index
    @name = params[:search]
    if @name.nil?
      @cocktails = Cocktail.all
    else
     @cocktails = Cocktail.where(name: @name)
    end
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :search)
  end
end
