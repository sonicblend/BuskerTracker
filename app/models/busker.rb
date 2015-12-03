class Busker < ActiveRecord::Base
  validates :name, presence: true
end
