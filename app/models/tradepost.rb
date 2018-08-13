class Tradepost < ActiveRecord::Base
    has_many :tradeapplies
    has_many :tradescraps
    belongs_to :user
end
