class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show; end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      return redirect_to project_url(@project), notice: "Project was successfully created."
    end

    render :new, status: :unprocessable_entity
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      return redirect_to project_url(@project), notice: "Project was successfully updated."
    end

    render :edit, status: :unprocessable_entity
  end

  # DELETE /projects/1
  def destroy
    @project.destroy!

    redirect_to projects_url, notice: "Project was successfully destroyed."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
