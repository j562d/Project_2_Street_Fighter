class FavoritesController < ApplicationController

  def index
    if params[:user_id]
      @favorites = Favorite.where(:user_id => params[:user_id])
    else
      @favorites = Favorite.all
    end
  end

end
