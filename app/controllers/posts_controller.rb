class PostsController < ApplicationController
  before_action :find_board, only: [:new, :create]
  before_action :find_post, only: [:show, :edit, :update]
  before_action :find_board_by_post, only: [:edit, :show, :update]
  
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
  end

  def update
    if @post.update(post_params)
      redirect_to @board, notice: '文章新增成功'
    else
      render :new, alert: "文章新增失敗" #會重新產生new頁面，且會有board_params的參數帶入原本的form (form_for的設計)
    end
  end

  def show
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
    params.require(:post).permit(:title, :content)
  end
end
