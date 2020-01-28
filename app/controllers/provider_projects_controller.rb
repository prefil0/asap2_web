class ProviderProjectsController < ApplicationController
  before_action :set_provider_project, only: [:show, :edit, :update, :destroy]

  # GET /provider_projects
  # GET /provider_projects.json
  def index
    @provider_projects = ProviderProject.all
  end

  # GET /provider_projects/1
  # GET /provider_projects/1.json
  def show
  end

  # GET /provider_projects/new
  def new
    @provider_project = ProviderProject.new
  end

  # GET /provider_projects/1/edit
  def edit
  end

  # POST /provider_projects
  # POST /provider_projects.json
  def create
    @provider_project = ProviderProject.new(provider_project_params)

    respond_to do |format|
      if @provider_project.save
        format.html { redirect_to @provider_project, notice: 'Provider project was successfully created.' }
        format.json { render :show, status: :created, location: @provider_project }
      else
        format.html { render :new }
        format.json { render json: @provider_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provider_projects/1
  # PATCH/PUT /provider_projects/1.json
  def update
    respond_to do |format|
      if @provider_project.update(provider_project_params)
        format.html { redirect_to @provider_project, notice: 'Provider project was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider_project }
      else
        format.html { render :edit }
        format.json { render json: @provider_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_projects/1
  # DELETE /provider_projects/1.json
  def destroy
    @provider_project.destroy
    respond_to do |format|
      format.html { redirect_to provider_projects_url, notice: 'Provider project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider_project
      @provider_project = ProviderProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_project_params
      params.fetch(:provider_project, {})
    end
end