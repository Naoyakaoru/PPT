class BoardsController < ApplicationController
  # app/views/layouts/boards.html.erb
  # 若找不到則往上
  # app/views/layouts/application.html.erb
  before_action :find_board, only: [:favorite, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @boards = Board.all
  end

  def show
    @post = @board.posts.includes(:user)
  end

  def favorite
    current_user.toggle_favorite_board(@board)
    redirect_to favorites_path, notice: 'OK!'
  end

  def new
    if user_signed_in?
      @board = Board.new #因為new有帶入預設值，所以變數不夠也沒關係
    else
      redirect_to root_path, notice: "請先登入會員"
    end
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
