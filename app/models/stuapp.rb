class Stuapp < ActiveRecord::Base
    belongs_to :stu
    belongs_to :user
end
