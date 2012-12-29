class User < ActiveRecord::Base
  attr_accessible :name
  has_many :experiments, dependent: :destroy
  has_many :undone_experiments, class_name: "Experiment", conditions: [accept: nil]
end
