class PostsController < ApplicationController
  def index
    @posts = Post.all
    # use Post.all is an active record query (ORM) to pull from the model and assign to an instance variable to feed into the view.

  end


  def new

  end

  def show
    @post = Post.find(params[:id])
    @new_comment = @post.comments.build
    @comments = Post.find(params[:id]).comments
  end

  def create
    @post = Post.create(post_params)

    #   redirect to /posts via route prefix as defined by "resources :posts"
    redirect_to posts_path
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post)

    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  # "Strong Parameters" used in mass-assignment as per the above code AND to
  # increase security to reject any parameters that are not permitted here.

  def post_params
    params
    .require(:post)
    .permit(:post_text, :title, :post_image)
  end

end
