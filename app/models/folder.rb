class Folder < ActiveRecord::Base
  attr_accessible :name, :user_id
 	validates :name ,:presence => {:message => "Name can't be blank." }
  has_many :videos
end
