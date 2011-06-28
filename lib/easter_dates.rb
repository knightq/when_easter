class EasterDates
  ## self.find
  ##=> In the year 2010, the Roman Easter is on 24 April. \n In the year 2010, the Greek Easter is on 24 April.
  def self.find(year = nil)
    roman_date = self.roman_easter(year)
    greek_date = self.greek_easter(year)
    return "In the year #{roman_date.year}, the Roman easter is on #{roman_date.strftime("%d %B")}. \nIn the year #{greek_date.year}, the Roman easter is on #{greek_date.strftime("%d %B")}."
  end
  
  ## EasterDates.roman_easter
  ## => Sun Apr 24 00:00:00 +0200 2011
  def self.roman_easter(year = nil)
    year = Time.now.year if year.nil?
    year = year.to_i if year.is_a?(String)
    g = year % 19 +1
    s = (year -1600) / 100 - (year-1600) / 400
    l = (((year - 1400) / 100) * 8) / 25
    
    p_2 = (3-11*g +s -l) % 30
    if p_2 == 29 || (p_2 == 28 && g > 11) 
      p = p_2 -1
    else
      p= p_2
    end
    
    d= (year + year / 4 - year / 100 + year / 400) % 7
    d_2 = (8-d) % 7
    
    p_3 = (80 + p) % 7
    x_2 = d_2 - p_3
    
    x = (x_2 -1) % 7 +1
    e = p+x
    
    if e < 11 
      Time.local(year,3,e+21)
    else
      Time.local(year,4,e-10)
    end
  end
  
  ## EasterDates.greek_easter
  ## => Sun Apr 24 00:00:00 +0200 2011
  def self.greek_easter(year = nil)
    year = Time.now.year if year.nil?
    year = year.to_i if year.is_a?(String)
    a = year % 19
    b = year % 4
    c = year % 7
    d = (19 * a + 16) % 30
    e = (2 * b + 4 * c + 6 * d) % 7;
    easter = 3 + d + e;
    if easter <= 30
      Time.local(year, 4, easter)
    else
      Time.local(year, 5, (easter - 30))
    end
  end
end