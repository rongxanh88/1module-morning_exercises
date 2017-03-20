class LeapYear
  def leap_years(n)
    year = 2017
    leap_years = []

    while leap_years.length < n do
      is_leap_year = true
      if year % 4 != 0
        is_leap_year = false
      end
      
      if year % 100 == 0
        is_leap_year = false
      end
      
      if (year % 4 == 0) and (year % 400 == 0)
        is_leap_year = true
      end
      
      if is_leap_year
        leap_years << year
      end
      year += 1
    end
    return leap_years
  end
end

get_years = LeapYear.new
years = get_years.leap_years(25)

puts "#{years}"