class Supplementary < Methods

    def initalize
        super add_spending
        instructions
    end

    def instructions
        puts "\nNow we add all those items that don't fall under day-to-day necessity"
        puts "\nAdd an item yourself, followed by the amount you spend on it per month\n"
        sleep(0.5)
        puts "Type [options] to view some suggestions or press enter to move onto the next step.\n\n"
        return self
    end


end
