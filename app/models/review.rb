class Review < ApplicationRecord
  validates :title, :body, presence:true
  belongs_to :user

end