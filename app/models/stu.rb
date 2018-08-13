class Stu < ActiveRecord::Base
    has_many :stuapps
    belongs_to :user
    
end
