require 'colorize'
require 'date'

class Account
    attr_reader :essentials_options, :supplementary_options
    attr_accessor :name, :date, :income, :essentials,  :total_after_essentials, :essentials_total, :supplementary

    def initialize
      @name = name
      @income = 0
      @date = date
      @essentials = {}
      @essentials_total = @essentials.values.inject(:+)
      @essentials_options = ["Mortgage", "Rent", "Insurance", "Bills", "Groceries", "Transport", "Medication"]
      @supplementary = {}
      @supplementary_options = ["Shopping", "Hobbies", "Dining out", "Entertainment"]
    end

   
    def total_after_essentials
      @essentials_total = @essentials.values.inject(:+)
      puts "\nYour remaining funds per month after essentials is: $#{@income - @essentials_total}"
    end


end
