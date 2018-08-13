class TradescrapController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def scrap_toggle
        scrap = Tradescrap.find_by(user_id: current_user.id, tradepost_id: params[:tradepost_id])
   
        if scrap.nil?
            Tradescrap.create(user_id: current_user.id, tradepost_id: params[:tradepost_id])
        else
            scrap.destroy
        end

        redirect_to "/trade/index/#{params[:tradepost_id]}"
    end
end
