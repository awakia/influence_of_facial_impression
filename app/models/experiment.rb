class Experiment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :accept, :face, :response_time, :share

  SHARES = [500, 450, 400, 350, 300, 250, 200, 150, 100]
  FACES = 25

  def self.generate_set(user)
    exp_list = []
    FACES.times do |face|
      SHARES.each do |share|
        exp_list << [face, share]
      end
    end
    2.times do
      exp_list.shuffle!
      exp_list.each do |ls|
        Experiment.create(user_id: user.id, face: ls[0] share: ls[1])
      end
    end
  end
end
