class BoardsController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :set_current_article, only: [:edit, :update]
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

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: '更新されました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit
    end
  end
  

  def destroy
    board = current_user.boards.find(params[:id])
    #  !をつけるときに削除されなかった時に例外処理をくらえられる。
    # 削除の場合は削除前と後で整合性を取らないといけない。
    board.destroy!
    redirect_to root_path, notice: '削除できました。'
  end
  
  private

  def board_params
    params.require(:board).permit(:name, :description)
  end

  def set_article
    @board = Board.find(params[:id])
  end

  def set_current_article
    @board = current_user.boards.find(params[:id])
  end
  
  
end