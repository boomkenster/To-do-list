class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.list_id = params[:list_id]
    if @task.save
      flash[:message] = "Task has been created!"
      redirect_to list_path(@task.list_id)
    else
      flash[:message] = @task.full_messages.join(", ")
      render :new
    end
  end

private
  def task_params
    params.require(:task).permit(:title,
                               :description,
                               :start_date,
                               :due_date
                              )
  end
end
