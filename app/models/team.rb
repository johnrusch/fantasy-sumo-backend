class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_and_belongs_to_many :wrestlers
  after_initialize :init

  def init
    self.points ||= 0
  end
  
end
