class BeerStyle < ActiveRecord::Base
  has_many :drinks
  
  validates :name, :description, presence: true
  
end
