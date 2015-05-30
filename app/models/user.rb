class User < ActiveRecord::Base
    validates :login, presence: true, length: {in: 6..20}, uniqueness: true
    validates :password, presence: true, length: {in: 6..20}, confirmation: true, numericality: { only_integer: false }
    validates :password_confirmation, presence: true
end
