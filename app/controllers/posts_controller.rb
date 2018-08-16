class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.reverse
    @search = Post.search do
      fulltext params[:search]
    end
    @posts = @search.results
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @new_comment  = Comment.build_from(@post, current_user.id, "")
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @user = User.find(current_user.id)
    @post = @user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '게시물이 성공적으로 업로드 되었습니다요!٩(๑❛ᴗ❛๑)۶♡' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '게시물이 성공적으로 수정 되었습니다요!٩(๑❛ᴗ❛๑)۶♡' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '게시물이 성공적으로 삭제 되었습니다요!٩(๑❛ᴗ❛๑)۶♡' }
      format.json { head :no_content }
    end
  end
  
  skip_before_action :verify_authenticity_token
  def like_toggle
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    #좋아요가 눌렸는지 체크
    if like.nil?
      Like.create(user_id: current_user.id, post_id: params[:post_id])
    else
      like.destroy
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :videourl)
    end
end
