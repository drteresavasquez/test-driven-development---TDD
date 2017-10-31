require 'minitest/autorun'
require_relative 'currency_converter'

class CurrencyConverterTest < Minitest::Test

    #create an instance so that it can be called later
    def setup
        @apples_to_oranges = CurrencyConverter.new("Apple", "Orange", 2)
        @amount = 5
    end

    #this checks to make sure a new converter instance can be created
    # def test_initialize
    #     @cc = CurrencyConverter.new()
    #     assert_instance_of CurrencyConverter, @cc
    # end

    #if try to initialize class with 1 or 2 arguments, should raise argument error

    ##### TEST PASSES IF THERE ARE ERRORS WHEN 1 OR 2 ARGUMENTS ARE RAISED becasue the test raises argument errors #####
    def test_initialize
        assert_raises ArgumentError do
        CurrencyConverter.new
        end
        
        #if try to initialize class with 1 argument, should raise argument error
        assert_raises ArgumentError do
            CurrencyConverter.new("arg1")
        end

        #if try to initialize class with 2 arguments, should raise argument error
        assert_raises ArgumentError do
            CurrencyConverter.new("arg1", "arg2")
        end

        #This is the test we want to work
        #already planned that the initialization will take in 3 errors
        @cc = CurrencyConverter.new("arg1", "arg2", "arg3")
        #take the 3 arguments and assign them
        assert_equal "arg1", @cc.currency_one # @cc.currency_one name of instance variables
        assert_equal "arg2", @cc.currency_two # @cc.currency_two name of instance variables
        assert_equal "arg3", @cc.conversion_rate # @cc.conversion_rate name of instance variables
    end

    def test_convert_currency_one_to_two
        #AGAIN....test passes if it doesn't work
        assert_raises ArgumentError do 
        @apples_to_oranges.convert_currency_one_to_two
        end

        @converted_value =  @apples_to_oranges.convert_currency_one_to_two(@amount)
        @expected_value = @amount*@apples_to_oranges.conversion_rate

        # This test will pass if it is right!
        assert_equal @expected_value, @converted_value
    end

    def test_convert_currency_two_to_one
         #AGAIN....test passes if it doesn't work
        assert_raises ArgumentError do 
            @apples_to_oranges.convert_currency_two_to_one
        end

        @converted_value =  @apples_to_oranges.convert_currency_two_to_one(@amount)

        # without the self in the main file
        # @expected_value = @amount * (1.0/@apples_to_oranges.conversion_rate) # Use 1.0 to get whole number
        
        @expected_value = @amount * @apples_to_oranges.reverse_conversion_rate # Use 1.0 to get whole number
        
        # This test will pass if it is right!
        assert_equal @expected_value, @converted_value

    end

    def test_reverse_converstion_rate
        # prevents from taking arguments
        assert_raises ArgumentError do
            @apples_to_oranges.reverse_conversion_rate("arg1")
        end

        @expected_value = 1.0/@apples_to_oranges.conversion_rate
        assert_equal @expected_value, @apples_to_oranges.reverse_conversion_rate
    end



end