Feature: EasterCalendar returns date

	In order to find liturgical date
	As a common churchgoer
	I want an easter_calendar to find easter date
	
Scenario: easter_calendar sets default year
	Given an easter_calendar with no date specified
	When I ask for the year
	Then I should see year 2011 in an easter_calendar

Scenario: easter_calendar sets given year
	Given year 2016
	And an easter_calendar
	When I ask for the year
	Then I should see year 2016 in an easter_calendar
	
Scenario: easter_calendar finds roman easter date
	Given year 2016
	And an easter_calendar
	When I find roman easter
	Then I should see roman easter date "Sun Mar 27 00:00:00 +0100 2016" in the output

Scenario: easter_calendar finds greek easter date
	Given year 2017
	And an easter_calendar
	When I find greek easter
	Then I should see greek easter date "Sun Apr 16 00:00:00 +0200 2017" in the output
	
Scenario: easter_calendar prints out the roman easter date
	Given year 2016
	And an easter_calendar
	When I ask for roman easter date
	Then I should see correct Roman date: "In the year 2016 the Roman Easter is on 27 March."
	
Scenario: easter_calendar prints out the greek easter date
	Given year 2017
	And an easter_calendar
	When I ask for greek easter date
	Then I should see correct Greek date: "In the year 2017 the Greek Easter is on 16 April."

Scenario: easter_calendar prints out the distance between greek and roman easter
	Given year 2020
	And an easter_calendar
	When I ask for distance between easters
	Then I should see a distance in weeks as "In the year 2020 the distance between Roman and Greek Easter is 1 week(s)."

Scenario: easter_calendar prints out full information about easter dates
	Given year 2019
	And an easter_calendar
	When I ask for complete easter information
	Then I should see correct Roman date: "In the year 2019 the Roman Easter is on 21 April."
	And I should see correct Greek date: "In the year 2019 the Greek Easter is on 28 April."
	And I should see a distance in weeks as "In the year 2019 the distance between Roman and Greek Easter is 1 week(s)."