class Admin::ProjectsController < Admin::ApplicationController
  # GET /admin/projects
  # GET /admin/projects.json
  def index
    @admin_projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @admin_projects }
    end
  end

  # GET /admin/projects/1
  # GET /admin/projects/1.json
  def show
    @admin_project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @admin_project }
    end
  end

  # GET /admin/projects/new
  # GET /admin/projects/new.json
  def new
    @admin_project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @admin_project }
    end
  end

  # GET /admin/projects/1/edit
  def edit
    @admin_project = Project.find(params[:id])
  end

  # POST /admin/projects
  # POST /admin/projects.json
  def create
    @admin_project = Project.new(params[:admin_project])

    respond_to do |format|
      if @admin_project.save
        format.html { redirect_to @admin_project, :notice => 'Project was successfully created.' }
        format.json { render :json => @admin_project, :status => :created, :location => @admin_project }
      else
        format.html { render :action => "new" }
        format.json { render :json => @admin_project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/projects/1
  # PUT /admin/projects/1.json
  def update
    @admin_project = Project.find(params[:id])

    respond_to do |format|
      if @admin_project.update_attributes(params[:admin_project])
        format.html { redirect_to @admin_project, :notice => 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @admin_project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/projects/1
  # DELETE /admin/projects/1.json
  def destroy
    @admin_project = Project.find(params[:id])
    @admin_project.destroy

    respond_to do |format|
      format.html { redirect_to admin_projects_url }
      format.json { head :ok }
    end
  end
end
