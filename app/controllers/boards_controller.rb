class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
 

  def new
    @article = current_user.boards.build
  end
  
end