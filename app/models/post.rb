class Post < ActiveRecord::Base
    
    belongs_to :user
    has_many :likes
    acts_as_commentable
    searchable do
    text :title, :content
  end
end
