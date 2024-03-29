class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy like ]
  before_action :authenticate_user!, except: [:index, :show]

  # Maybe needed for likes
  respond_to :js, :html, :json

  # GET /posts or /posts.json
  def index
    @posts = Post.order(created_at: :desc)
    @likes = 88
    @comments = 99
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments.order(created_at: :desc)
  end

  # Get all posts by a user
  def user_posts
    @user_posts = current_user.posts
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.except(:tags))

    # Link with current user
    @post.user = current_user

    create_or_delete_tags(@post, params[:post][:tags])

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params.except(:tags))
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PUT /posts/1/like
  def like
    if current_user.voted_for? @post
      @post.unliked_by current_user
      puts "UNLIKED this"
      puts @post.get_likes.size
    else
      @post.liked_by current_user
      puts "LIKED"
      puts @post.get_likes.size
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :tags)
    end

    def create_or_delete_tags(post, tags)
      # Clean up existing taggables
      post.taggables.destroy_all

      # Strip removes whitespace from before and after
      tags = tags.strip.split(",").map { |element| element.strip }

      tags.each do |tag|
        post.tags << Tag.find_or_create_by(name: tag)
      end
    end
end
