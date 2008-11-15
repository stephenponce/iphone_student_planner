require 'date'
# Author: Josh Adams
# This helper is based on CalendarHelper.
# WeekViewHelper allows you to draw a databound week view calendar with fine-grained CSS formatting

module WeekViewHelper
   VERSION = '0.0.1'
  # Returns an HTML week-view calendar. In its simplest form, this method generates a plain
  # calendar (which can then be customized using CSS) for a given span of days.
  # However, this may be customized in a variety of ways -- changing the default CSS
  # classes, generating the individual day entries yourself, and so on.
  # 
  # The following options are required:
  #  :start_date
  #  :end_date
  # 
 # The following are optional, available for customizing the default behaviour:
 #   :table_class       => "week-view"        # The class for the <table> tag.
  #   :day_name_class    => "dayName"         # The class is for the names of the days, at the top.
  #   :day_class         => "day"             # The class for the individual day number cells.
  #                                             This may or may not be used if you specify a block (see below).
  #   :show_today        => true              # Highlights today on the calendar using the CSS class 'today'. 
  #                                           # Defaults to true.
  #   :previous_span_text   => nil            # Displayed left if set
  #   :next_span_text   => nil                # Displayed right if set
  #
 # For more customization, you can pass a code block to this method, that will get two argument, both DateTime objects,
 # and return a values for the individual table cells. The block can return an array, [cell_text, cell_attrs],
  # cell_text being the text that is displayed and cell_attrs a hash containing the attributes for the <td> tag
  # (this can be used to change the <td>'s class for customization with CSS).
  # This block can also return the cell_text only, in which case the <td>'s class defaults to the value given in
  # +:day_class+. If the block returns nil, the default options are used.
  # 
  # Example usage:
  #   week_view(:start_date => (Date.today - 5), :end_date => Date.today) # This generates the simplest possible week-view.
  #   week_view(:start_date => (Date.today - 5), :end_date => Date.today, :table_class => "calendar_helper"}) # This generates a week-view, as
 #                                                                             # before, but the <table>'s class
 #                                                                             # is set to "calendar_helper".
  #   week_view(:start_date => (Date.today - 5), :end_date => Date.today) do |s| # This generates a simple week-view, but gives special spans
  #     if listOfSpecialSpans.include?(s)          # (spans that are in the array listOfSpecialSpans) one CSS class,
  #       ["", {:class => "specialSpan"}]      # "specialSpan", and gives the rest of the spans another CSS class,
  #     else                                      # "normalSpan". You can also use this to highlight the current time differently
  #       ["", {:class => "normalSpan"}]       # from the rest of the days, etc.
  #     end
  #   end
  #
 # For consistency with the themes provided in the calendar_styles generator, use "specialSpan" as the CSS class for marked days.
 # 
  def week_view(options = {}, &block)
    raise(ArgumentError, "No start date given")  unless options.has_key?(:start_date)
    raise(ArgumentError, "No end date given") unless options.has_key?(:end_date)
    span = (options[:end_date] - options[:start_date]).to_i # Get the number of days represented by the span given
    dates = (options[:start_date]..options[:end_date])
    start_time = 8
    end_time   = 17
    time_range = (start_time..end_time).to_a
  duration = 15
    block                        ||= Proc.new {|d| nil}
    defaults = {
      :table_class => 'week-view',
      :day_name_class => 'dayName',
      :day_class => 'day',
      :show_today => true,
      :previous_span_text => nil,
      :next_span_text => nil
  }
  options = defaults.merge options
  	if options[:url]
      next_start_date = options[:end_date] + 1
      next_end_date   = next_start_date + 5
      next_link = link_to('>>', url_for(options[:url].merge(:start_date => next_start_date, :end_date => next_end_date)) + options[:url_append])
      prev_start_date = options[:start_date] - span
      prev_end_date = options[:start_date] - 1
      prev_link = link_to('<<', url_for(options[:url].merge(:start_date => prev_start_date, :end_date => prev_end_date)) + options[:url_append])
 end
    # TODO Use some kind of builder instead of straight HTML
    cal = %(<table class="#{options[:table_class]}">\n)
    cal << %(\t<thead>\n\t\t<tr>\n)
    cal << %(\t\t\t<th>#{dates.first.strftime("%Y")}</th>\n)
    dates.each do |d|
      cal << "\t\t\t<th#{Date.today == d ? " class='today'" : ""}>#{d.strftime("%A")}<br />#{d.strftime("%m/%d")}</th>\n"
    end
    cal << "\t\t</tr>\n\t</thead>\n\t<tbody>\n"
  time_range.each do |hour|
    minutes = 0
      print_hour = hour.to_s.rjust(2, '0')
      4.times do |i|
        print_minutes = minutes.to_s.rjust(2, '0')
        cal << %(\t\t<tr class='m#{print_minutes} d#{duration}'>\n)
        cal << %(\t\t\t<th rowspan="4"><h3>#{hour}</h3>AM</th>\n) if i==0
        options[:start_date].upto(options[:end_date]) do |d|
          the_minutes = minutes
          print_start_minutes = the_minutes.to_s.ljust(2, '0')
        start_datetime_string = %(#{d.to_s(:db)}T#{print_hour}:#{print_start_minutes}:00-06:00)
    start_datetime = DateTime.parse(start_datetime_string).to_datetime
         end_datetime = (start_datetime + duration.minutes).to_datetime
         range = (start_datetime...end_datetime)
         # cell_attrs should return a hash.
         cell_text, cell_attrs = block.call(range)
         cell_text ||= ""
         cell_attrs ||= {}
         cell_attrs[:class] = cell_attrs[:class].to_s + " today" if Date.today == d
    cell_attrs = cell_attrs.map {|k, v| %(#{k}="#{v}") }.join(" ")
         cal << "\t\t\t<td #{cell_attrs}>\n#{cell_text}&nbsp;\t\t\t</td>\n"
       end
       minutes += duration
       cal << %(\t\t</tr>)
     end
   end
   cal << "\n\t</tbody>\n</table>"
 end

private
end
