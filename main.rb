require_relative 'account.rb'
require_relative 'essentials.rb'
require_relative 'methods.rb'
require_relative 'supplementary.rb'
require 'date'

#Option for choice of timespan (monthly, weekly, fortnightly)
#Error Handling + Check for Int + Check for $

  account = Account.new

  print "\nWhat is your name?  "
  @name = gets.strip
  print "\nWhat is your monthly income? (or 4 weeks of take home pay)  $"
  account.income = gets.chomp.to_i

  #creates a hash for essentials items and their values
  #suggested options for essentials, potential to move into other classes
  add_essentials = Essentials.new.instruct_bar.instructions.add_spending(account.essentials, account.essentials_options)
  view_essentials = Essentials.new.spending_table(account.essentials, account.essentials_total)
  total_after_ess = account.total_after_essentials

  add_supplementary = Supplementary.new.instructions.add_spending(account.supplementary, account.supplementary_options)
  view_supplementary = Supplementary.new.spending_table(account.supplementary, account.supplementary_total)
