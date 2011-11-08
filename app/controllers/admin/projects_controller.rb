class Admin::ProjectsController < Admin::ApplicationController
  # GET /admin/projects
  # GET /admin/projects.json
  def index
    @projects = Project.asc('name')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @projects }
    end
  end

  # GET /admin/projects/1
  # GET /admin/projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @project }
    end
  end

  # GET /admin/projects/new
  # GET /admin/projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @project }
    end
  end

  # GET /admin/projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /admin/projects
  # POST /admin/projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        current_user.add_project(@project.name)
        format.html { redirect_to admin_projects_url, :notice => 'Project was successfully created.' }
        format.json { render :json => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/projects/1
  # PUT /admin/projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to admin_projects_url, :notice => 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/projects/1
  # DELETE /admin/projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to admin_projects_url }
      format.json { head :ok }
    end
  end
end
