require 'colorize'
require 'date'

class Account
    attr_reader :essentials_options, :supplementary_options
    attr_accessor :name, :date, :income, :essentials,  :total_after_essentials, :essentials_total, :supplementary

    def initialize
      @income = 0
      @essentials = {}
      @essentials_total = 0
      @essentials_options = ["Mortgage", "Rent", "Insurance", "Bills", "Groceries", "Transport", "Medication"]
      @supplementary = {}
      @supplementary_options = ["Shopping", "Hobbies", "Dining out", "Entertainment"]
      @supplementary_total = 0
    end

    def essentials_total
      @essentials_total = @essentials.values.inject(:+)
      return @essentials_total
    end

    def supplementary_total
      @supplementary_total = @supplementary.values.inject(:+)
      return @supplementary_total
    end
   
    def total_after_essentials
      puts "\nYour remaining funds per month after essentials is: $#{@income - @essentials_total}"
    end

    def total_after_sup
      puts "\nYour remaining funds per month after supplementary is: $#{@income - @essentials_total - @supplementary_total}"
    end


end
