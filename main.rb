require_relative 'income.rb'
require_relative 'essentials.rb'

#Option for choice of timespan (monthly, weekly, fortnightly)
  puts "\n\nWhat is your monthly income? (or 4 weeks of take home pay)"
  income = gets.chomp
# Check for integer here

#Elaborate on what essentials encompasses here
  puts "\n\nNow lets input your essential spending"
  sleep(1)
  puts "\nTo view some suggestions type options, or add an item of your own followed by the amount you spend per month"
  
  # creates a hash for essentials items and their values
  essentials = {}
  add_essentials = Essentials.new.add_essential_item(essentials)
  view_essentials = Essentials.new.essentials_table(essentials).Essentials.new.total_after_essentials