require 'colorize'
require 'date'

class Account
    attr_reader :essentials_options, :supplementary_options
    attr_accessor :name, :date, :income, :essentials,  :total_after_essentials, :essentials_total, :supplementary, :savings

    def initialize(name, income)
      @name = name
      @income = income
      @savings = Hash.new(0)
    end

      #prints costs list in tabled format with total
    def spending_table(hash, total)
        puts "".center(80, "_")
      hash.each{ |item, value| puts tabled_format(item, value) }
        puts "".center(80, "_")
      total = hash.values.inject(:+)
        puts tabled_format("Total", total)
        prompt = TTY::Prompt.new
        prompt.keypress("Press enter to continue", keys: [:return])
        puts `clear`
    end

    def savings
      @savings = @income - @essentials_total.to_i - @supplementary_total.to_i
      puts "\nYour remaining funds per month after supplementary is: $#{@savings}"
      return @savings
    end

    def spending_bar
      spending_bar = "Income: #{@income}\tEssentials: #{essentials_total.to_i}\tSupplementary: #{supplementary_total.to_i}\n Remaining unallocated funds per month: #{total_after_sup}"
      return spending_bar
    end
end
