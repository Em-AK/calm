class Refugee < ActiveRecord::Base
  belongs_to :mediator
  validates_presence_of :email
end
