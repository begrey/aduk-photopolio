class MypageController < ApplicationController
    
    def mypage
        @time = Time.new.year
        
        @mpo = current_user.posts.reverse
        @comm = Comment.where("user_id = ?", current_user)
        
        @character = Character.find_by(user_id: current_user.id)
        @friend= []
        @friend2= []
        @hanchinchu = []
        @han = current_user.mateapplies.reverse
        @han.each do |a|
            if !a.matching 
                @hanchinchu << a 
            else
                @friend << a
            end
        end
        @on = Mateapply.where(partner: current_user.id).reverse
        @onchinchu = []
        @on.each do |a|
            if !a.matching 
                @onchinchu << a 
            else
                @friend2 << a
            end
        end
        
        
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
