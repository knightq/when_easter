class EasterDates
  #Todo: implement Greek Easter date finding algorhythm.
  def self.find(year = nil)
    date = self.roman_easter(year)
    return "In the year #{date.year}, the Roman easter is on #{date.strftime("%d %B")}."
  end
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
end