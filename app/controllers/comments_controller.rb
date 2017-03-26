class CommentsController < ApplicationController


  def index
    @comments = Comment.all

    render :json => @comments
  end

  def new

  end

  def create
    @comment = Post.find(params[:post_id]).comments.create(comment_params)

    redirect_to post_path(params[:post_id])

  end


  def update
    comment_updated = Comment.find(params[:id]).update_attributes(comment_params)

  redirect_to post_path(params[:post_id])
  end


  def destroy
      comment_destroy = Comment.find(params[:id]).destroy

  end




  private
   def comment_params
     params
     .require(:comment)
     .permit(:comment_text)
   end

end
