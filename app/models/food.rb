class Food < ApplicationRecord
  belongs_to :storage
  belongs_to :container
  belongs_to :user
end
