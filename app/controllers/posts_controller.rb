class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  # def create
  #   @post = Post.new(post_params)

 
  #   @post.save
  #   redirect_to @post
  # end


  def index
    @posts = Post.all
  end


  def create
      @post = Post.new(params[:post])

      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          # format.json { render json: @post, status: :created, location: @post }
        else
          format.html { render action: "new" }
          # format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end


  def show
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
end



 
private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end












