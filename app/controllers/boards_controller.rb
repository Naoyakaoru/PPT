class BoardsController < ApplicationController
  # app/views/layouts/boards.html.erb
  # 若找不到則往上
  # app/views/layouts/application.html.erb
  before_action :find_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.where(deleted_at: nil)
  end
  
  def show
  end

  def new
    @board = Board.new #因為new有帶入預設值，所以變數不夠也沒關係
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_path, notice: "新增成功"
    else
      render :new, alert: "新增失敗" #會重新產生new頁面，且會有board_params的參數帶入原本的form (form_for的設計)
    end

    # Board.create(title: params[:title], intro: params[:intro])
    # render html: "ok"
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: "更新成功"
    else
      render :edit, alert: "更新失敗" #會重新產生new頁面，且會有board_params的參數帶入原本的form (form_for的設計)
    end

  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: "刪除成功"
  end
  
  private
  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :intro) #沒有寫的就會被濾掉
  end

end
