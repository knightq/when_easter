require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "EasterCalendar" do
  it "should say '24 Apr 2011' when it receives the find(2011) message" do
    easter_calendar = EasterCalendar.new
    date = easter_calendar.find(2011)
    date.should == "24 Apr 2011"
  end
end