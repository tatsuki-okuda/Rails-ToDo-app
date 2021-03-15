class CommentsController < ApplicationController

  def new
    task = Task.find(params[:task_id])
    @comment = task.comments.build
  end

  def create
    task = Task.find(params[:task_id])
    board = Board.find(params[:board_id])
    @comment = task.comments.build(comment_params)
    if @comment.save
      redirect_to board_path(board,task), notice: 'タスクを追加'
    else
      flash.now[:error] = '追加できませんでした'
      render :new
    end
  end


  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end