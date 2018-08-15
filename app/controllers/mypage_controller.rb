class MypageController < ApplicationController
    
    def mypage
        @time = Time.new.year
        @character = Character.find_by(user_id: current_user.id)
        @hanchinchu = current_user.mateapplies
        @onchinchu = Mateapply.where("partner = ? ", current_user.id)
        
        @tradepost = current_user.tradepost
        @mytradeapp = current_user.tradeapplies
        @badtradeapp = Tradeapply.where("partner = ?", current_user.id)
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
