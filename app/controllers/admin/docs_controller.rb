class Admin::DocsController < Admin::ApplicationController
  # GET /admin/docs
  # GET /admin/docs.json
  def index
    @docs = Doc.asc('created_at').page(params[:page]).per(params[:per])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @docs }
    end
  end

  # GET /admin/docs/1
  # GET /admin/docs/1.json
  def show
    @doc = Doc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @doc }
    end
  end

  # GET /admin/docs/new
  # GET /admin/docs/new.json
  def new
    @doc = Doc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @doc }
    end
  end

  # GET /admin/docs/1/edit
  def edit
    @doc = Doc.find(params[:id])
  end

  # POST /admin/docs
  # POST /admin/docs.json
  def create
    params[:doc][:format] = params[:doc][:format].split(', ')
    @doc = Doc.new(params[:doc])

    respond_to do |format|
      if @doc.save
        format.html { redirect_to @doc, :notice => 'Doc was successfully created.' }
        format.json { render :json => @doc, :status => :created, :location => @doc }
      else
        format.html { render :action => "new" }
        format.json { render :json => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/docs/1
  # PUT /admin/docs/1.json
  def update
    @doc = Doc.find(params[:id])

    respond_to do |format|
      if @doc.update_attributes(params[:doc])
        format.html { redirect_to @doc, :notice => 'Doc was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/docs/1
  # DELETE /admin/docs/1.json
  def destroy
    @doc = Doc.find(params[:id])
    @doc.destroy

    respond_to do |format|
      format.html { redirect_to admin_docs_url }
      format.json { head :ok }
    end
  end
end
