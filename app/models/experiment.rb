class Experiment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :accept, :face, :response_time, :share
end
