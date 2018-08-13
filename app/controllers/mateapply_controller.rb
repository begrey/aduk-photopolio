class MateapplyController < ApplicationController
    skip_before_filter :verify_authenticity_token
    def apply
        app = Mateapply.find_by(user_id: current_user.id, partner: params[:user_id])
    
        if app.nil?
            Mateapply.create(user_id: current_user.id,  matching: "false", partner: params[:user_id] )   
        else
            app.destroy
 
        end
    
    redirect_to "/mypage/mypage"
    end
    
    
    def accept
        @apply = Mateapply.find(params[:apply_id])
        @apply.matching = "true"
        @apply.save
   
        redirect_to "/mypage/mypage"
   end
end
