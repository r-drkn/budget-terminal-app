require_relative 'income.rb'
require_relative 'essentials.rb'
require_relative 'methods.rb'
require_relative 'supplementary.rb'

#Option for choice of timespan (monthly, weekly, fortnightly)
#Error Handling + Check for Int + Check for $
  puts `clear`
  puts "\n\nWhat is your monthly income? (or 4 weeks of take home pay)"
  @income = gets.chomp.to_i

#Elaborate on what essentials encompasses here
  puts "Great!"
  

   
  #creates a hash for essentials items and their values
  essentials = {}
  #suggested options for essentials, potential to move into other classes
  essentials_options = ["Mortgage", "Rent", "Insurance", "Bills", "Groceries", "Transport", "Medication"]
  add_essentials = Essentials.new.instructions.add_spending(essentials, essentials_options)
  view_essentials = Essentials.new.spending_table(essentials)
  # total_after_ess = Essentials.new.total_after_essentials

  supplementary = {}
  supplementary_options = ["Shopping", "Hobbies", "Dining out", "Entertainment"]
  add_supplementary = Supplementary.new.instructions.add_spending(supplementary, supplementary_options)
  view_supplementary = Supplementary.new.spending_table(supplementary)
  # total_after_sup =