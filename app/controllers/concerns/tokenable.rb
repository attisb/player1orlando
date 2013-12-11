module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    self.code = loop do
      random_token = SecureRandom.random_number(999999)
      break random_token unless self.class.exists?(code: sprintf('%06d', random_token))
    end
  end
end