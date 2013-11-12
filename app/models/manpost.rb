class Post < ActiveRecord::Base
  default_scope order: 'createdat DESC'
  attr_accessible :content, :userid
  belongs_to :user

  validates :content, length: { maximum: 200 }
end