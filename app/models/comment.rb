class Comment < ApplicationRecord
  belongs_to :company

  validates :body, presence: true
end
