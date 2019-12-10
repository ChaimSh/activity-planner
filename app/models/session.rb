class Session < ApplicationRecord
  belongs_to :location
  belongs_to :activity
end
