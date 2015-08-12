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
      flash.now[:message] = @task.errors.full_messages.join(", ")
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
    @task.mark_complete
    @task.save!
    redirect_to list_path(@task.list_id)
  end

  def image_remove
    @task = Task.find(params[:task_id])
    @task.image = nil
    @task.save
    redirect_to list_path(@task.list_id)
  end

  def destroy
    @task = Task.find(params[:task_id])
    if @task.destroy
      flash.now[:message] = "List has been removed"
      redirect_to list_path(@task.list_id)
    else
      flash.now[:errors] = @list.errors.full_messages
      redirect_to root_path
    end
  end

  def change_status
    @task = Task.find(params[:task_id].to_i)
    @task.status = params[:status]
    if @task.save
      respond_with @task
    else
      respond_with({:errors => @task.errors}, :status => 422, :location => tasks_path)
    end
  end

private
  def task_params
    params.require(:task).permit(:title,
                                 :description,
                                 :start_date,
                                 :due_date,
                                 :image
                              )
  end
end
