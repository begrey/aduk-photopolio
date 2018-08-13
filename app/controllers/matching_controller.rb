class MatchingController < ApplicationController
  
  def main
    @my_cha = Character.find_by(user_id: current_user.id)
    @modu = Character.all
  end

  def ok
  end
  
  
  def list
    
  
    time = Time.new
    @me = Character.find_by(user_id: current_user.id)
    @me_age = time.year - current_user.birthyear 
    @result = []
    @my_character = @me.character
    
    
    @b_year1 = time.year - (params[:age1].to_i) + 1
    @b_year2 = time.year - (params[:age2].to_i) + 1
    
    if params[:sex] <=> "both"
      @oc = User.where("interest = ?", current_user.interest)
      @others = @oc.where(:birthyear => (@b_year2)..(@b_year1))
    else
      @oc = User.where("sex = ? AND interest = ? ", params[:sex], current_user.interest)
       @others = @oc.where(:birthyear => (@b_year2)..(@b_year1))
    end
    
    i = 0
    
    @others.each do|a| #모든 사람들 중에서
     i = 0
     @my_character.each do|b| #나의 성격과 하나 하나 
      Character.find(a.id).character.each do|c| #다른사람들의 성격과 하나 하나 비교
        if b == c #만약 내 성격항목과 다른 사람의 성격항목이 같으면
          i += 1
          break
        end #if꺼
      end#c꺼
    
     end#b꺼
      if i >= 2 
        @result << User.find_by(id: a.id)
        
      end #if꺼
    
  end #a꺼d
   
  
 end# list action꺼
  
end
