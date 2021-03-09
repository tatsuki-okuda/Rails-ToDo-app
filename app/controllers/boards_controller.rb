class BoardsController < ApplicationController
  before_action :set_article, only: [:show, :edit]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @boards = Board.all
  end
 
  def show
  end

  def new
    @boards = current_user.boards.build
  end
  
  def edit
    
  end
  
  private

  def set_article
    @board = Board.find(params[:id])
  end
  
end