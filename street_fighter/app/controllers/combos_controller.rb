class CombosController < ApplicationController

  before_action :set_combo, only: [:show, :edit, :update, :destroy, :favorite]

  before_action :authorize, except: [:index, :show]

  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorite_combos << @combo unless current_user.favorite_combos.exists?(@combo)
      redirect_to combo_path
      flash[:notice] = "You have FAVORITED"

    elsif type =="unfavorite"
      current_user.favorite_combos.delete(@combo)
      redirect_to combo_path
      flash[:notice] = "You have unfavoirted"

    else
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def index
    if params[:character]
      @combos = Combo.where(:character => params[:character])
    elsif params[:user_id]
      @combos = Combo.where(:user_id => params[:user_id])
    elsif params[:sort]
      @combos = Combo.order(params[:sort])
    else
    @combos = Combo.all
    end
  end

  def show
  #@combo = Combo.find(params[:id])
  @comment = Comment.new

  end


  def new
    @combo = Combo.new
    @comment = Comment.new(combo_id: params[:combo_id])
#    @options = ["Ryu", "Ken", "Zangief", "M. Bison", "Chun-Li", "Dhalsim"]
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
#   @combo = Combo.find(params[:id])
#   @combo.destroy if @combo.user == current_user
#   redirect_to combos_path
  end


  private
  def combo_params
    params.require(:combo).permit(:character, :difficulty, :damage, :command, :image)
  end

  def set_combo
    @combo = Combo.find(params[:id])
  end
end

