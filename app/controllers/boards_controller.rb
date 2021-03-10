class BoardsController < ApplicationController
  before_action :set_article, only: [:show, :edit]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @boards = Board.all
  end
 
  def show
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      # 第二引数でフラッシュ（アラート）を設定できる
      redirect_to board_path(@board), notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end
  
  
  def edit
  end
  
  private

  def board_params
    params.require(:board).permit(:name, :description)
  end

  def set_article
    @board = Board.find(params[:id])
  end
  
end