class User < ActiveRecord::Base
  belongs_to :character
  has_many :post
  has_many :likes
  has_many :stu
  has_many :stuapps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def is_like?(post) 
    Like.find_by(user_id: self.id, post_id: post.id).present? 
  end
  
  def is_stuapp?(stu) 
    Stuapp.find_by(writer: self.name, stu_id: stu.id).present? 
  end
  
  has_many :tradepost
  has_many :tradeapplies
  def is_tradeapply?(tradepost) 
  Tradeapply.find_by(user_id: self.id, tradepost_id: tradepost.id).present?
  end
  
  has_many :tradescraps
  def is_tradescrap?(tradepost) 
    Tradescrap.find_by(user_id: self.id, tradepost_id: tradepost.id).present?
  end
  
  #친구추가
  has_many :mateapplies
   def is_mateapply?(user) 
    Mateapply.find_by(user_id: self.id, partner: user.id).present? 
  end
end
