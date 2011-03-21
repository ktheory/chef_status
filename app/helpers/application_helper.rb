module ApplicationHelper
  def reporting_interval
    "#{REPORTING_INTERVAL / 60} minutes"
  end

  def friendly_time(time)
    content_tag :span, time_ago_in_words(time), :title => time
  end
end
