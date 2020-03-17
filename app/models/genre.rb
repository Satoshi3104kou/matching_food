class Genre < ApplicationRecord
  has_many :foods
  has_ancestry
  has_many :users
end
