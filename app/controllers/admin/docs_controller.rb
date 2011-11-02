class Admin::DocsController < Admin::ApplicationController
  # GET /admin/docs
  # GET /admin/docs.json
  def index
    @admin_docs = Doc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @admin_docs }
    end
  end

  # GET /admin/docs/1
  # GET /admin/docs/1.json
  def show
    @admin_doc = Doc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @admin_doc }
    end
  end

  # GET /admin/docs/new
  # GET /admin/docs/new.json
  def new
    @admin_doc = Doc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @admin_doc }
    end
  end

  # GET /admin/docs/1/edit
  def edit
    @admin_doc = Doc.find(params[:id])
  end

  # POST /admin/docs
  # POST /admin/docs.json
  def create
    @admin_doc = Doc.new(params[:admin_doc])

    respond_to do |format|
      if @admin_doc.save
        format.html { redirect_to @admin_doc, :notice => 'Doc was successfully created.' }
        format.json { render :json => @admin_doc, :status => :created, :location => @admin_doc }
      else
        format.html { render :action => "new" }
        format.json { render :json => @admin_doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/docs/1
  # PUT /admin/docs/1.json
  def update
    @admin_doc = Doc.find(params[:id])

    respond_to do |format|
      if @admin_doc.update_attributes(params[:admin_doc])
        format.html { redirect_to @admin_doc, :notice => 'Doc was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @admin_doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/docs/1
  # DELETE /admin/docs/1.json
  def destroy
    @admin_doc = Doc.find(params[:id])
    @admin_doc.destroy

    respond_to do |format|
      format.html { redirect_to admin_docs_url }
      format.json { head :ok }
    end
  end
end
