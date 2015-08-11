class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.list_id = params[:list_id]
    if @task.save
      flash.now[:message] = "Task has been created!"
      redirect_to list_path(@task.list_id)
    else
      flash.now[:message] = @task.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @task.list_id = params[:list_id]
  end

  def update
    @task = Task.find(params[:id])
    @task.list_id = params[:list_id]
    if @task.update(task_params)
      flash.now[:message] = "Task Updated"
      redirect_to list_path(@task.list_id)
    else 
      flash.now[:message] = @task.full_messages.join(", ")
      render :edit
    end
  end

  def complete
    @task = Task.find(params[:format])
    @task.list_id = params[:list_id]
    @task.complete
    @task.save!
    redirect_to list_path(@task.list_id)
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
