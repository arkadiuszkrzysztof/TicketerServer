class Tickets < ActiveRecord::Base
  belongs_to :eventID
  belongs_to :ownerID
end
