class MicroPostsController < ApplicationController
	before_filter :get_user , :get_post, only: [:new,:index,:show, :edit, :update, :destroy]
  def index
  	@posts = @user.micro_posts
  end

  def new
  	@micro_post = @user.micro_posts.build
  end

  def edit
  end

  def show
  end

  def create

    @micro_post = @user.micro_posts.new(content: params[:content])

    respond_to do |format|
      if @micro_post.save
        format.html { redirect_to user_micro_posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @micro_post }
      else
        format.html { render :new }
        format.json { render json: @micro_post.errors, status: :unprocessable_entity }
      end
    end

  end

	def update
    
	    respond_to do |format|
	      if @micro_post.update({:content => params[:content]})
	        format.html { redirect_to user_micro_posts_path, notice: 'Post was successfully updated.' }
	        format.json { render :show, status: :ok, location: @micro_post }
	      else
	        format.html { render :edit }
	        format.json { render json: @micro_post.errors, status: :unprocessable_entity }
	      end
	    end
	  end

def destroy
    @micro_post.delete
    respond_to do |format|
      format.html { redirect_to user_micro_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    private
    def set_post
      @post = MicroPost.find(params[:id])
    end

    
    def post_params
      params.require(:micro_post).permit(:user_id, :content)
    end

    def get_user
    	@user = User.find_by_id params[:user_id]
    end

    def get_post
      @micro_post = MicroPost.find_by_id params[:id]
    end


end
