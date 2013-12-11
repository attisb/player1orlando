class Event < ActiveRecord::Base

  validates :title, :description, :starts_at, :ends_at, presence: true

  def to_param
    [id, title.parameterize].join("-")
  end
  

end
