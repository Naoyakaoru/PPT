class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = current_user.favorited_boards
  end

  def new
    @board = favorited_boards.new
  end


  private
  def favorited
    
  end
  
end