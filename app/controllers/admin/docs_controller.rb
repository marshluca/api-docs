class Admin::DocsController < Admin::ApplicationController
  before_filter :find_project

  # GET /admin/docs
  # GET /admin/docs.json
  def index
    @docs = @project.docs.asc('created_at').page(params[:page]).per(params[:per])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @docs }
    end
  end

  # GET /admin/docs/1
  # GET /admin/docs/1.json
  def show
    @doc = @project.docs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @doc }
    end
  end

  # GET /admin/docs/new
  # GET /admin/docs/new.json
  def new
    @doc = @project.docs.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @doc }
    end
  end

  # GET /admin/docs/1/edit
  def edit
    @doc = @project.docs.find(params[:id])
  end

  # POST /admin/docs
  # POST /admin/docs.json
  def create
    @doc = @project.docs.new(params[:doc])

    respond_to do |format|
      if @project.docs.save
        format.html { redirect_to project_doc_url(@project.docs.project, @doc), :notice => 'Doc was successfully created.' }
        format.json { render :json => @doc, :status => :created, :location => @doc }
      else
        format.html { render :action => "new" }
        format.json { render :json => @project.docs.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/docs/1
  # PUT /admin/docs/1.json
  def update
    @doc = @project.docs.find(params[:id])

    respond_to do |format|
      if @project.docs.update_attributes(params[:doc])
        format.html { redirect_to project_doc_url(@project.docs.project, @doc), :notice => 'Doc was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @project.docs.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/docs/1
  # DELETE /admin/docs/1.json
  def destroy
    @doc = @project.docs.find(params[:id])
    @project.docs.destroy

    respond_to do |format|
      format.html { redirect_to admin_docs_url }
      format.json { head :ok }
    end
  end

  def category
    @docs = @project.docs.where(:category => params[:cate]).asc('created_at').page(params[:page]).per(params[:per])

    render :index
  end

  private
    def find_project
      @project = Project.find(params[:project_id])
    end
end
