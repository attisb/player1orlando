class Timeline < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin
  belongs_to :drink
end
