class Tradescrap < ActiveRecord::Base
  belongs_to :tradepost
  belongs_to :user
end
