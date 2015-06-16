class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :destroy, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project), notice: "Project Created"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice: "Question Updated"
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to project_path, notice: "Project Destroyed"
  end

  private

  def find_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit([:title, :body, :description, :due_date])
  end

end
