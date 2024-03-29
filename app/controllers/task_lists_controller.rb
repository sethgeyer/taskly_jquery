class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def show
    @task_list = TaskList.find(params[:id])
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new
    @task_list.name = params[:task_list][:name]

    if @task_list.save
      flash[:notice] = "Task List was created"
      redirect_to "/"
    else
      render :new
    end

  end

  def edit
    @task_list = TaskList.find(params[:id])
  end

  def update
    @task_list = TaskList.find(params[:id])
    @task_list.name = params[:task_list][:name]
    if @task_list.save
      flash[:notice] = "Task List was updated"
      redirect_to "/"
    else
      render :edit
    end
  end

end


# As a user
# Given that I'm logged in
# When I click on the title of a task list
# Then I only see the tasks for that task list