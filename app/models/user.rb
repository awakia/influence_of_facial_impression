class User < ActiveRecord::Base
  attr_accessible :name
  has_many :experiment, dependent: :destroy
end
