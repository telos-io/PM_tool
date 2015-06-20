class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :destroy, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project_params = params.require(:project).permit([:title, :description, :due_date])
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path(@project), notice: "Project Created"
    else
      render :new
    end
  end

  def show
    #@task = Task.new
    @project = Project.find params[:id]
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path(@project), notice: "Project Updated"
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project Destroyed"
  end

  private

  def find_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit([:title, :description, :due_date])
  end

end
