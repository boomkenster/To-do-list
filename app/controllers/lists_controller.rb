class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
  end

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:message] = "List has been created!"
      redirect_to root_path
    else
      flash[:errors] = @list.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:message] = "List has been removed"
      redirect_to root_path
    else
      flash[:errors] = @list.errors.full_messages
      redirect_to root_path
    end
  end


  def list_params
  params.require(:list).permit(:title,
                               :description,
                              )
  end
end
