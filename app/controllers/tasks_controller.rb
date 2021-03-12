class TasksController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(board), notice: 'タスクを追加'
    else
      flash.now[:error] = '追加できませんでした'
      render :new
    end
  end
  

  def edit
    
  end
  
  def update
    
  end

  def destroy
    
  end
  
  

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline)
  end
end