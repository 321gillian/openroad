class Availability < ApplicationRecord
    validates :start_time, uniqueness: true
    validates :end_time, uniqueness: true

    
end
