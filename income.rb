require 'colorize'
require_relative 'methods.rb'

class MonthlyIncome < Methods

    attr_reader :income

    def initalize
      @income = 0
      super add_spending(hash), spending_table(hash)
    end



end
