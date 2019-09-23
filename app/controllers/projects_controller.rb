class ProjectsController < ApplicationController
  def index
    projects = Project.all
    render json: projects
  end
  def show
    project = Project.find_by(id: params[:id])
    render json: project.to_json(include: [:manager, :tasks])
  end
  def create
    # debugger
    project = Project.create(project_params)
    render json: project.manager, include: "**"
  end
end

private

def project_params
  params.require(:project).permit(:name, :description, :manager_id)
end
