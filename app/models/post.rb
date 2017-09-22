class Post < ApplicationRecord
  belongs_to :user
  belongs_to :city

  Post.order('id DESC')

end
