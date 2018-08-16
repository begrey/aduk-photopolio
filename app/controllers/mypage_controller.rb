class MypageController < ApplicationController
    
    def mypage
        @time = Time.new.year
        
        @mpo = current_user.posts.reverse
        @comm = Comment.where("user_id = ?", current_user)
        
        @character = Character.find_by(user_id: current_user.id)
        @hanchinchu = current_user.mateapplies.reverse
        @onchinchu = Mateapply.where("partner = ? ", current_user.id).reverse
        
        @tradepost = current_user.tradeposts.reverse
        @mytradeapp = current_user.tradeapplies.reverse
        @badtradeapp = Tradeapply.where("partner = ?", current_user.id).reverse
        
        @mystu = Stu.where("writer = ?", current_user.name).reverse
        @mystuap = Stuapp.where("writer = ?", current_user.name).reverse
        @badstu = Stuapp.where("stupost_writer = ?", current_user.name).reverse
        
        @scrap = current_user.tradescraps.reverse
    end
    
    def chanew
        
    end
    
    def chacreate
        @character = Character.new
        @character.user_id = current_user.id
        @character.introduce = params[:introduce]
        
         params[:name][:character].each do |x|
         @character.character << x
     end
     
     @character.save
     
     redirect_to'/mypage/mypage'
        
    end
end
