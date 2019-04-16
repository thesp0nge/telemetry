require 'securerandom'

class Id < ActiveRecord::Base
  def self.get_new_id
    return SecureRandom.uuid
  end
end
