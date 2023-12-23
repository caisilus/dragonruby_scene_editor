class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects
  def index
    @projects = Project.order('created_at desc')
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

    saved = @project.save
    return render :new, status: :unprocessable_entity unless saved

    redirect_to projects_url, notice: "Project was successfully created."
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

    redirect_to projects_url, notice: "Project was successfully deleted."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
