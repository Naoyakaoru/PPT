class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
  end

  def create
    Board.create(title: params[:title], intro: params[:intro])
    render html: "ok"
  end
end
