class Admin::CategoriesController < Admin::ApplicationController
  before_filter :find_project

  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @categories = @project.categories

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @categories }
    end
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
    @category = @project.categories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @category }
    end
  end

  # GET /admin/categories/new
  # GET /admin/categories/new.json
  def new
    @category = @project.categories.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @category }
    end
  end

  # GET /admin/categories/1/edit
  def edit
    @category = @project.categories.find(params[:id])
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @category = @project.categories.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_project_categories_url(@project), :notice => 'Category was successfully created.' }
        format.json { render :json => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/categories/1
  # PUT /admin/categories/1.json
  def update
    @category = @project.categories.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to admin_project_categories_url(@project), :notice => 'Category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @category = @project.categories.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to admin_project_categories_url(@project) }
      format.json { head :ok }
    end
  end


  private
    def find_project
      @project = Project.find(params[:project_id])
    end
end
