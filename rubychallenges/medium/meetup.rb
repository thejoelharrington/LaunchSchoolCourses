class Meetup
  require 'date'

  ORDINALS = %w(first second third fourth fifth)

  def initialize(year, month)
    @start_date = Date.civil(year, month)
  end

  def day(weekday_name, descriptor)
    weekday = (weekday_name.downcase + '?').to_sym
    candidates = (@start_date...@start_date.next_month).select(&weekday)

    case descriptor.downcase
    when 'last'   then candidates.last
    when 'teenth' then candidates.select { |d| d.day.between?(13, 19) }.first
    else               candidates[ORDINALS.index(descriptor.downcase)]
    end
  end
end
