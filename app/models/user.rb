class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :employee, optional:true
  # getter for current user
  def self.current
    Thread.current[:user]
  end

  # setter for current user
  def self.current=(user)
    Thread.current[:user] = user
  end
end
