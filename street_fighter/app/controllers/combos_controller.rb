class CombosController < ApplicationController

  before_action :set_combo, only: [:show, :edit, :update, :destroy]

  before_action :authorize, except: [:index, :show]

  def index
    @combos = Combo.all
  end

  def show
    @combo
  end


  def new
    @combo = Combo.new
  end

  def create
    @combo = current_user.combos.create(combo_params)
    redirect_to combos_path
  end

#    if @combo.save
#      flash[:success] = "Combo succesfully created"
#      redirect_to combos_path
#    else
#      render :new
#    end
#  end

  def edit

  end

  def update
    if @combo.update_attributes(combo_params)
      redirect_to @combo
    else
      render :edit
    end
  end

  def destroy
    @combo.destroy
    redirect_to combos_path
  end


  private
  def combo_params
    params.require(:combo).permit(:character, :difficulty, :damage, :command, :image)
  end

  def set_combo
    @combo = Combo.find(params[:id])
  end
end

