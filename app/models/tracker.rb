class Tracker < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink
  
  attr_accessor :code
end
