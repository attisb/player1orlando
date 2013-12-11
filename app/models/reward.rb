class Reward < ActiveRecord::Base
  has_many :discounts, :dependent => :destroy
end
