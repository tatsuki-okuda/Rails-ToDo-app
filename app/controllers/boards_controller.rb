class BoardsController < ApplicationController
  before_action :set_article, only: [:show]


  def index
    @boards = Board.all
  end
 
  def show
  end

  def new
    @article = current_user.boards.build
  end
  
  private

  def set_article
    @board = Board.find(params[:id])
  end
  
end