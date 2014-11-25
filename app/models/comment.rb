class Comment < ActiveRecord::Base
  attr_accessible :context
  belongs_to :blog
  belongs_to :user
end
