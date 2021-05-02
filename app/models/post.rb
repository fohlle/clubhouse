class Post < ApplicationRecord
  belongs_to :member

  validates :title, presence: true
  validates :body, presence: true
end
