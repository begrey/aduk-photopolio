class Character < ActiveRecord::Base
      serialize :character, Array
      
      belongs_to :user
end
