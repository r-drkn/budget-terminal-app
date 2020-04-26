require 'colorize'
require 'date'

class Account
  attr_accessor :name, :date, :income, :savings

  def initialize(name, income, date)
    @name = name
    @income = income
    @date = date
    @savings = 0
  end

  #user details
  def user_details
    puts header("Budget name: #{@name} | Income: $#{@income} | Date: #{@date}").cyan
  end

  #prints costs list in tabled format with total
  def spending_table(hash, total)
      puts "".center(80, "_")
    hash.each{ |item, value| puts tabled_format(item, value) }
      puts "".center(80, "_")
    total = hash.values.inject(:+)
      puts tabled_format("Total", total)
  end

  def calculate_savings(total_income, total_essentials, total_supplementary)
    @savings = total_income - total_essentials - total_supplementary
    return @savings
  end

  def display_savings
    puts "\n"
    print centered("Your remaining funds per month after supplementary is: $").rstrip
    print "#{@savings}\n\n".light_green
  end


  def spending_bar
    spending_bar = "Income: #{@income}\tEssentials: #{essentials_total.to_i}\tSupplementary: #{supplementary_total.to_i}\n Remaining unallocated funds per month: #{total_after_sup}"
    return spending_bar
  end
end
