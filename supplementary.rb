require 'tty-prompt'
class Supplementary

    attr_accessor :supplementary, :supplementary_total

    def initalize
        @supplementary = Hash.new(0)
        @supplementary_total = 0
        instructions
    end

    def add_supplementary
        puts `clear`
        puts centered("Add a cost or press enter to skip\n")
        prompt = TTY::Prompt.new
        @supplementary = prompt.collect do
            key(:diningout).ask('Dining out:', convert: :int)
            key(:entertainment).ask('Entertainment: ', convert: :int)
            key(:hobbies).ask('Hobbies: ', convert: :int)
            key(:shopping).ask('Shopping: ', convert: :int)
            key(:streaming).ask('Streaming: ', convert: :int)
            while prompt.yes?("'Would you like to add anything else?'")
                print "Item: "
                key(gets.chomp.downcase.to_sym).ask('Cost: ', convert: :int)
                end
            end
        @supplementary.delete_if { |k, v| v == nil || v == 0 }
    end

    def sum_supplementary
        @supplementary_total = @supplementary.values.inject(:+)
        return @supplementary_total
    end  

    def instructions
        puts `clear`
        puts "\nNow we add all those items that don't fall under day-to-day necessity"
        puts "\nAdd an item yourself, followed by the amount you spend on it per month\n"
        puts "Type [options] to view some suggestions or press enter to move onto the next step.\n\n"
        prompt = TTY::Prompt.new
        prompt.keypress("Press enter to continue", keys: [:return])
        return self
    end
end
