class FavoritesController < ApplicationController
  def new
  end

  def create
    current_user.twitter.favorite(params[:tweet])
    redirect_to current_user
  end
end
