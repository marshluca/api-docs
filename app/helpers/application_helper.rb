module ApplicationHelper
  def json_pretty_inspect string
    begin
      JSON.parse(string).pretty_inspect
    rescue => e
      string
    end
  end
end
