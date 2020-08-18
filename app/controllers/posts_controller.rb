class PostsController < ApplicationController
  before_action :find_board, only: [:new, :create]
  before_action :find_post, only: [:show, :destroy]
  before_action :find_board_by_post, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @posts = Post.all
  end
  
  def new
    @post = @board.posts.new
  end

  def create
    @post = @board.posts.new(post_params)

    if @post.save
      redirect_to @board, notice: '文章新增成功'
    else
      render :new, alert: "文章新增失敗" #會重新產生new頁面，且會有board_params的參數帶入原本的form (form_for的設計)
    end
  end

  def edit
    # @post = Post.find_by(id: params[:id], user: current_user) 
    @post = current_user.posts.find(params[:id])
    @board = Board.find(@post.board_id)
  end

  def update
    @post = current_user.posts.find(params[:id])
    @board = Board.find(@post.board_id)
    if @post.update(post_params)
      redirect_to @post, notice: '文章更新成功'
    else
      render :edit, alert: "文章更新失敗" #會重新產生edit頁面，且會有board_params的參數帶入原本的form (form_for的設計)
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to board_path(@board), notice: "刪除成功"
  end

  def show
    @comment = @post.comments.new
    @comments = @post.comments.all.order(id: :desc)
  end
  
  private
  def find_post
    @post = Post.find(params[:id])
  end

  def find_board
    @board = Board.find(params[:board_id])
  end

  def find_board_by_post
    # @board = Board.find_by(id: @post.board_id)
    @board = Board.find(@post.board_id)
  end

  def post_params
    params.require(:post)
          .permit(:title, :content)
          .merge(user: current_user) #belongs_to 產生的user，此處只是產生一個hash欄位而已
          #有或沒有!都沒差, 因為此處只要回傳結果
  end
end
