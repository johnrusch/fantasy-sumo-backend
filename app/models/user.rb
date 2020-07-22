class User < ApplicationRecord
    has_and_belongs_to_many :leagues
    has_many :teams
    has_many :wrestlers, through: :teams
    has_secure_password
    validates :name, uniqueness: true
end
