class Admin::ParametersController < Admin::ApplicationController
  before_filter :find_project
  before_filter :find_doc

  # GET /admin/parameters
  # GET /admin/parameters.json
  def index
    @parameters = @doc.parameters.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @parameters }
    end
  end

  # GET /admin/parameters/1
  # GET /admin/parameters/1.json
  def show
    @parameter = @doc.parameters.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @parameter }
    end
  end

  # GET /admin/parameters/new
  # GET /admin/parameters/new.json
  def new
    @parameter = @doc.parameters.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @parameter }
    end
  end

  # GET /admin/parameters/1/edit
  def edit
    @parameter = @doc.parameters.find(params[:id])
  end

  # POST /admin/parameters
  # POST /admin/parameters.json
  def create
    @parameter = @doc.parameters.new(params[:parameter])

    respond_to do |format|
      if @parameter.save
        format.html { redirect_to admin_project_doc_parameters_url(@project, @doc), :notice => 'Parameter was successfully created.' }
        format.json { render :json => @parameter, :status => :created, :location => @parameter }
      else
        format.html { render :action => "new" }
        format.json { render :json => @parameter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/parameters/1
  # PUT /admin/parameters/1.json
  def update
    @parameter = @doc.parameters.find(params[:id])

    respond_to do |format|
      if @parameter.update_attributes(params[:parameter])
        format.html { redirect_to admin_project_doc_parameters_url(@project, @doc), :notice => 'Parameter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @parameter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/parameters/1
  # DELETE /admin/parameters/1.json
  def destroy
    @parameter = @doc.parameters.find(params[:id])
    @parameter.destroy

    respond_to do |format|
      format.html { redirect_to admin_parameters_url }
      format.json { head :ok }
    end
  end

  private
    def find_project
      @project = Project.find(params[:project_id])
    end

    def find_doc
      @doc = Doc.find(params[:doc_id])
    end
end
