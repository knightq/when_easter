# when_easter

Ever wondered when will Easter (or Passover, if you prefer) be next year? No worries, use when_easter!

It's still being developed and refactored, so beware ;) Binaries work well though.
### Install
	$ gem install when_easter
	
### Use
	
	$ when_easter #the default year is current year
	In the year 2011, the Roman Easter is on 24 April.
	In the year 2011, the Greek Easter is on 24 April.
	In the year 2010 the distance between Roman and Greek Easter is 0 week(s).
	
	$ when_easter 2010
	In the year 2010, the Roman Easter is on 04 April.
	In the year 2010, the Greek Easter is on 04 April.
	In the year 2010 the distance between Roman and Greek Easter is 0 week(s).
	
If you want to find only one date, you can also try

	$ when_roman_easter
or

	$ when_greek_easter

and also

	$ find_distance
	
If you wish, you can also use WhenEaster::EasterCalendar class and its methods to fetch the dates only

	
	roman_date = WhenEaster::EasterCalendar.find_roman_easter_date(2010)
or, if you wan't to play more with EasterCalendar instance, 
	
	my_calendar = WhenEaster::EasterCalendar.new(2010) #if you want to get data for the year 2010
	another_roman_date = 	my_calendar.roman_easter
greek date is similiar - you can get it by replacing roman with greek
	
And get

	=> Sun Apr 21 00:00:00 +0200 2019
A Date object

### License

Released under the MIT license.
(c) 2011 Michał Nierebiński