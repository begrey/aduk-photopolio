class MateapplyController < ApplicationController
    skip_before_filter :verify_authenticity_token
    def apply
        app = Mateapply.find_by(user_id: current_user.id, partner: params[:user_id])
        @part = User.find(params[:user_id])
    
        if app.nil?
            Mateapply.create(user_id: current_user.id,  matching: "false", partner: params[:user_id] )
            @new_notification = NewNotification.create! user: @part,content: "#{current_user.name}님이 친구신청을 하셨습니다", link: "/mypage/mypage"
        else
            app.destroy
            @notification = NewNotification.find_by(content: "#{current_user.name}님이 친구신청을 하셨습니다", user: @part)
            @notification.destroy
 
        end
    
    redirect_to "/mypage/mypage"
    end
    
    
    def accept
        @apply = Mateapply.find(params[:apply_id])
        @apply.matching = "true"
        @apply.save
        
        @part = User.find(@apply.user_id)
        @new_notification = NewNotification.create! user: @part,content: "#{@apply.partner}님이 친구신청을 수락하셨습니다\n", link: "/mypage/mypage"
   
        redirect_to "/mypage/mypage"
   end
end
