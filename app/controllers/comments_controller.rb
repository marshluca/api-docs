class CommentsController < BaseController
  def create
    @doc = Doc.find(params[:comment][:doc_id])
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @doc.comments.push(@comment)
        format.html { redirect_to project_doc_url(@doc.project, @doc), :notice => 'Comment was successfully created.' }
        format.json { render :json => @comment, :status => :created, :location => @comment }
      else
        format.html { redirect_to project_doc_url(@doc.project, @doc), :error => 'Comment cannot be created.' }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
end
