module CalendarHelper
  def custom_calendar(options = {}, &block)
  raise "calendar requires a block" unless block
  render SimpleCalendar::BusinessWeekCalendar.new(self, options, &block)
  end
  
  class SimpleCalendar::BusinessWeekCalendar < SimpleCalendar::Calendar
    private
  
      def date_range
        beginning = start_date.beginning_of_week + 1.day
        ending    = start_date.end_of_week - 1.day
        (beginning..ending).to_a
      end
  end

end

