class TasksController < ApplicationController

  before_action :set_board_task, only: [:edit, :update]
  
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
    board = Board.find(params[:board_id])
    # @task = board.tasks.find(params[:id])
  end
  
  def update
    board = Board.find(params[:board_id])
    if @task.update(task_params)
      redirect_to board_path(board), notice: '更新されました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:id])
    #  !をつけるときに削除されなかった時に例外処理をくらえられる。
    # 削除の場合は削除前と後で整合性を取らないといけない。
    task.destroy!
    redirect_to board_path(board), notice: '削除できました。'
  end
  
  

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline)
  end

  def set_board_task
    @task = board.tasks.find(params[:id])
  end
  

end