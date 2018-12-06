class MatchingController < ApplicationController
before_action :authenticate_user!
  def main
    @my_cha = Character.find_by(user_id: current_user.id)
    @modu = Character.all
  end

  def ok
  end
  
  
  def list
    
    time = Time.new
    @me = Character.find_by(user_id: current_user.id)
    @other = User.all.where.not(id: current_user)
    @me_age = time.year - current_user.birthyear 
    @result = []
    @my_character = @me.character
    
    @it =[]
    @b_year1 = time.year - (params[:age1].to_i) + 1
    @b_year2 = time.year - (params[:age2].to_i) + 1
    
    if params[:sex] == "both"
      @oc = @other.where("interest = ?", current_user.interest)
      @others = @oc.where(:birthyear => (@b_year2)..(@b_year1))
    else
      @oc = @other.where("sex = ? AND interest = ? ", params[:sex], current_user.interest)
      @others = @oc.where(:birthyear => (@b_year2)..(@b_year1))
    end
    
    i = 0 #일치 개수
    j = @my_character.count #내 성격개수
   
    
    @others.each do|a| #모든 사람들 중에서
     i = 0
     k = 0 #상대방 성격개수

     if Character.find_by(user_id: a.id) == nil
         next
     end
     
     
     @my_character.each do|b| #나의 성격과 하나 하나 
        
        k = Character.find_by(user_id: a.id).character.count
        Character.find_by(user_id: a.id).character.each do|c| 
            if b == c  
                i += 1
            end
        end #c의 
          
     end #b의
     
     
      if  i >= 2 || j == i || k == i
        @result << User.find_by(id: a.id)
      end #if꺼
    
  end #a꺼
   
end

end
