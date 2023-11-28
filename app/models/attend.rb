class Attend < ApplicationRecord
  include Hashid::Rails
  belongs_to :conference
  belongs_to :delegate

  after_update { |record|
    broadcast_replace_later_to self.conference, target: self.conference, 
      partial: "attend/attended_number", 
      locals: {
        attended_number: record.conference.attends.where(:attended => true).count,
        total: record.conference.attends.count, 
        conference: record.conference
      }
  }

end
