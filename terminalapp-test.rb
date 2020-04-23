# #puts each char

# #string.each_char {|c| putc c ; sleep 0.05; $stdout.flush }

# def slowly(string)
#     string.each_char { |c| putc c ; sleep 0.05; $stdout.flush }
# end


# string = "a b c d e f g h i j k"
# string.each_char {|c| putc c ; sleep 0.05; $stdout.flush }
# slowly(string)


hash = {rent: 500, bills: 100, phone: 30, transportation: 25}

#Linebreak
# puts "".center(80, "-") DRYING

#Can be made into a class method DRY


# def tabled_format(item, value) #DRY
#   "#{item.capitalize}" + " "*(60 - item.length) + "$#{value}"
# end

# #Creates the tabled formatting DRY
# puts "".center(65, "_")
# hash.each{ |item, value| puts tabled_format(item, value) }
# puts "".center(65, "_")
# puts tabled_format("Total", total)

# # def hash_input(hash)
  #     item = gets.chomp.to_sym
  #     value = gets.chomp
  #     hash[item] = value
  # end
  
  # hash_input(essentials)



# BUDGET APP

# <!--        MAIN POINTS          -->
# <!-- 1. ITEMS ALWAYS GO INTO HASHES |:item, $|
#      2. Total.
#      3. A class is a factory for objects (note the plural). If you don't want to create multiple instances of the class, there is no need for it to exist.
#      4. An array for each class containing suggested entries-->

# Monthly Income => class => initalizer(monthly_income)
# 4 weeks of pay

# Mandatory spending
# 	mortgage rent insurance		<30%
# 	house and phone bills		expected bill price//actual bill price update feature
# 	groceries					update feature
# 	transport					<15%
# 	medication

# Debts Goals and Retirement

# Discretionary spending
# 	shopping
# 	hobbies
# 	television subscriptions
# 	coffee
# 	dining out

# Envelopes/Pots

# Future Calendar Feature


# Is it your first time here?

# Yes

# Well lets get started:

# First, your goals:



# require 'yaml'
# array_of_hashes = []

# File.open("path/yamlfile.yml","w") do |file|
# file.write array_of_hashes.to_yaml
# end