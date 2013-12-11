class Discount < ActiveRecord::Base
  belongs_to :reward
  belongs_to :user
  
  include Tokenable
end
