Given /^an easter_calendar with no date specified$/ do
  @easter_calendar = WhenEaster::EasterCalendar.new
end

Given /^year (\d+)$/ do |year|
  @given_year = year
end

Given /^an easter_calendar$/ do
  @easter_calendar = WhenEaster::EasterCalendar.new(@given_year)
end
When /^I ask for the year$/ do
  @year = @easter_calendar.year
end
When /^I find roman easter$/ do
  @roman_date = @easter_calendar.class.find_roman_easter_date(@easter_calendar.year)
end
When /^I find greek easter$/ do
  @greek_date = @easter_calendar.class.find_greek_easter_date(@easter_calendar.year)
end
Then /^I should see year (\d+) in an easter_calendar$/ do |year|
  @year.should == year.to_i
end

Then /^I should see "([^"]*)" in the output$/ do |date|
  @date.to_s.should == date
end

When /^I ask for roman easter date$/ do
  @roman_date = @easter_calendar.find_roman
end

When /^I ask for greek easter date$/ do
  @greek_date = @easter_calendar.find_greek
end

Then /^I should see "([^"]*)"$/ do |easter_date|
  @date.should == easter_date
end
Then /^I should see roman easter date "([^"]*)" in the output$/ do |date|
  @roman_date.to_s.should == date
end

Then /^I should see greek easter date "([^"]*)" in the output$/ do |date|
  @greek_date.to_s.should == date
end

When /^I ask for distance between easters$/ do
  @distance = @easter_calendar.find_distance
end

Then /^I should see a distance in weeks as "([^"]*)"$/ do |distance|
  @distance.should == distance
end
Then /^I should see correct Roman date: "([^"]*)"$/ do |date|
  @roman_date.to_s.should == date
end

Then /^I should see correct Greek date: "([^"]*)"$/ do |date|
  @greek_date.to_s.should == date
end

When /^I ask for complete easter information$/ do
  @roman_date = @easter_calendar.find_roman
  @greek_date = @easter_calendar.find_greek
  @distance = @easter_calendar.find_distance
end

