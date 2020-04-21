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
  sleep(1)
  puts `clear`

  puts "Now lets input your essential spending.\n\nTo view some suggestions type options, or add an item of your own followed by the amount you spend per month\n\n"
  
  # creates a hash for essentials items and their values
  essentials = {}
  add_essentials = Essentials.new.add_spending(essentials)
  view_essentials = Essentials.new.spending_table(essentials)
  # total_after_ess = Essentials.new.total_after_essentials

  supplementary = {}
  add_supplementary = Supplementary.new.add_spending(supplementary)