class Lesson < ActiveRecord::Base
    enum bookable: [:available, :unavailable]
    has_many :order_items
    validates :start_time, uniqueness: true
    
    after_initialize :set_default_bookable, :if => :new_record?

    def set_default_bookable
        self.bookable ||= :available
      end

    def date_readable
        start_time.strftime("%d/%m/%Y")
    end 

    def time_readable
        start_time.strftime("%l%P")
    end 

    def datetime_readable
        date_readable + " " + time_readable
    end

end
