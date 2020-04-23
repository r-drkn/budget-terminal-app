require 'tty-prompt'
class Supplementary < Methods

    def initalize
        super add_spending
        instructions
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
