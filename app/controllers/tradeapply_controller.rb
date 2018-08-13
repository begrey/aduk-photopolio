class TradeapplyController < ApplicationController
    def list
    @applies = Tradeapply.where("tradepost_id = ?", params[:post_id])
end
    
def new
end

def create
    @post = Tradepost.find(params[:post_id])
    @apply = Tradepost.find(params[:post_id]).tradeapplies.create
    @apply.title = params[:title]
    @apply.content = params[:content]
    @apply.user_id = current_user.id
    @apply.matching = false
    @apply.save
    
    redirect_to "/apply/con/#{@apply.id}/#{@post.id}"
  end
  
 def con
     @post = Tradepost.find(params[:post_id])
     @apply = Tradeapply.find(params[:apply_id])
     
 end
 
 
 def edit
     @post = Tradepost.find(params[:post_id])
     @apply = Tradeapply.find(params[:apply_id])
 end
 
 def update
     @post = Tradepost.find(params[:post_id])
     @apply = Tradeapply.find(params[:apply_id])
     @apply.title = params[:title]
     @apply.content = params[:content]
     @apply.save
    
    redirect_to "/apply/con/#{@apply.id}/#{@post.id}"
 end
 
 def delete
     @post = Tradepost.find(params[:post_id])
     @apply = Tradeapply.find(params[:apply_id])
     @apply.destroy
     redirect_to "/trade/index/#{@post.id}"
 end
 
 def accept
     
     
     @apply = Tradeapply.find(params[:apply_id])
     @apply.matching = true
     @apply.save
     
     redirect_to "/apply/con/#{@apply.id}/#{@apply.tradepost.id}"
end
end
