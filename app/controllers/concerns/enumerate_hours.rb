module EnumerateHours
   def enumerate_hours(start, end_)
        Enumerator.new { |y| loop { y.yield start; start += 1.hour } }.take_while { |d| d < end_ }
      end

end 