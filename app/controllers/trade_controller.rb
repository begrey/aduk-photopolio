class TradeController < ApplicationController
    def home
    @posts = Tradepost.all
    @na = Tradepost.where("category = ? ", "교환")
    @gong = Tradepost.where("category =? ", "공구")
    
  end

  def index
    @post = Tradepost.find(params[:post_id])
  end
  
  def new
  end
  
  def create
    @post = Tradepost.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.category = params[:category]
    @post.wantitem = params[:wanted]
    @post.interest = "나중에 옮기면서 유저 관심 분야 받아 올 예정"
    @post.user_id = current_user.id
    @post.state = 0
    @post.save
   redirect_to "/trade/index/#{@post.id}"
  end
  
  def delete
    @post = Tradepost.find(params[:post_id])
    @post.destroy
    redirect_to '/trade/home'
  end
  
  def edit
    @post = Tradepost.find(params[:post_id])
  end
  
  def update
    @post = Tradepost.find(params[:post_id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.category = params[:category]
    @post.wantitem = params[:wanted]
    @post.interest = "나중에 옮기면서 유저 관심 분야 받아 올 예정"
    @post.save
    @post.save
    redirect_to "/trade/index/#{@post.id}"
  end
end
