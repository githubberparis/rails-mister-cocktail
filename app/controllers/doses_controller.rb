class DosesController < ApplicationController
  def index
      @doses = Dose.all
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
