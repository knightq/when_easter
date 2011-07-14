module WhenEaster
  class EasterCalendar

    attr_reader :year
    def initialize(year = nil)
      @year = Time.now.year if year.nil?
      @year = year if year.is_a?(Integer)
      @year = year.to_i if year.is_a?(String)
    end
    def distance_in_weeks
      ((self.class.find_greek_easter_date(year) - self.class.find_roman_easter_date(year))/3600/24/7).to_i
    end
    def find
      find_roman+"\n"+find_greek+"\n"+find_distance
    end
    
    def find_roman
      "In the year #{@year} the Roman Easter is on #{self.class.find_roman_easter_date(@year).strftime("%d %B")}."
    end
    def find_greek
      "In the year #{@year} the Greek Easter is on #{self.class.find_greek_easter_date(@year).strftime("%d %B")}."
    end
    def find_distance
      "In the year #{@year} the distance between Roman and Greek Easter is #{distance_in_weeks} week(s)."
    end
    # => Sun Apr 24 00:00:00 +0200 2011
    def self.find_roman_easter_date(year)
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

# => Sun Apr 24 00:00:00 +0200 2011
    def self.find_greek_easter_date(year)
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
end