class Home < ActiveRecord::Base
  belongs_to :host, dependent: :destroy
end
