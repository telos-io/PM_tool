class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task), notice: "Question Created"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path(@task), notice: "Task Updated"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "Task Destroyed"
  end

  private

  def find_task
    @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit([:title, :due_date])
  end

end
