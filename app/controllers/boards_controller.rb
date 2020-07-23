class BoardsController < ApplicationController
def index
  @boards = Board.all
end
def new
end
def create
  render html: params
end
end
