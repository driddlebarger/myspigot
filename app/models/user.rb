class User < ApplicationRecord
  validates_acceptance_of :terms, :allow_nil => false, :accept => "true", :on => :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
