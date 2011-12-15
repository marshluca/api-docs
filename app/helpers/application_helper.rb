module ApplicationHelper
  require 'pp'

  def json_pretty_inspect string
    begin
      JSON.parse(string).pretty_inspect
    rescue => e
      Rails.logger.info [e, e.backtrace].flatten.join("\n")
      string
    end
  end
end
