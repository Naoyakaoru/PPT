class Api::V1::BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
end
