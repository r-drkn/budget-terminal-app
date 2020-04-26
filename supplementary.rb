require 'tty-prompt'
class Supplementary

  attr_accessor :supplementary, :supplementary_total

  def initalize
    @supplementary = Hash.new(0)
    @supplementary_total = 0
  end

  def supplementary_header
    puts header("supplementary spending").light_green
  end

  def add_supplementary
    puts header("Add a cost or press [enter] to skip").light_black
    prompt = TTY::Prompt.new
    @supplementary = prompt.collect do
      key(:diningout).ask('Dining out: $', convert: :int)
      key(:entertainment).ask('Entertainment: $', convert: :int)
      key(:hobbies).ask('Hobbies: $', convert: :int)
      key(:shopping).ask('Shopping: $', convert: :int)
      key(:streaming).ask('Streaming: $', convert: :int)
      while prompt.yes?("'Would you like to add anything else?'")
        print "Item: "
        key(gets.chomp.downcase.to_sym).ask('Cost: $ ', convert: :int)
        end
      end
    @supplementary.delete_if { |k, v| v == nil || v == 0 }
    @supplementary = @supplementary.transform_values(&:to_i)
    clear
  end

  def edit_supplementary
    puts header("To add a new cost, type a title, followed by the price").light_black
    puts header("To edit a cost, type its followed by the new price.").light_black
    puts header("To delete a cost, type its name and leave the cost blank.").light_black
    prompt = TTY::Prompt.new
    edited_hash = prompt.collect do
      while prompt.yes?(header("Would you like to add, edit or delete an item?")) 
        print "Item: "
        key(begin #validation method to check item does not contain integers
          validate_item(gets.chomp.downcase.to_sym)
          rescue InvalidItemError=> e  
          puts e.message 
          print "Item: "
          retry
          end).ask('Cost: $ ', validate: /^[0-9]*$/)
        end
      
      end
    @supplementary_hash = @supplementary.merge!(edited_hash){|key, oldval, newval| oldval = newval}
    @supplementary.delete_if { |k, v| v == nil || v == 0 }
    @supplementary = @supplementary.transform_values(&:to_i)
    clear
  end

  def sum_supplementary
    @supplementary_total = @supplementary.values.inject(:+)
    return @supplementary_total
  end  

  def instructions
    puts centered("Now we add all those items that don't fall under day-to-day necessity")
    puts centered("Add an item yourself, followed by the amount you spend on it per month")
    puts centered("Type [options] to view some suggestions or press enter to move onto the next step.")
    return self
  end
end
