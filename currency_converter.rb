class CurrencyConverter
    attr_accessor :currency_one, :currency_two, :conversion_rate, :reverse_conversion_rate

    def initialize(currency_one, currency_two, conversion_rate)
        @currency_one = currency_one
        @currency_two = currency_two
        @conversion_rate = conversion_rate

        raise "Invalid format." unless is_a_string(@currency_one) || is_a_string(@currency_two)|| !is_a_string(@conversion_rate)
    end

    def is_a_string(element)
        element.is_a?String
    end

    def convert_currency_one_to_two(amount)
        raise "Invalid format." unless is_a_string(amount)
        #in Ruby last line in method is evaluated and returned
        amount * @conversion_rate

    end

    def convert_currency_two_to_one(amount)
        raise "Invalid format." unless is_a_string(amount)
        #if this instance variable has a value, use it....
        if @reverse_conversion_rate
        amount * @reverse_conversion_rate
        #if not, do this instead
        else
            amount * reverse_conversion_rate
        end
    end

    def reverse_conversion_rate
        @reverse_conversion_rate = 1.0/@conversion_rate
    end

end