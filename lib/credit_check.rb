# Your Luhn Algorithm Here
#class credit_number_checker (card_number, valid)
class CreditCard

  def initialize(card_number)
    @card_number = card_number.to_i.digits.reverse
    @digits_doubled = []
    @digits_fixed = []
    @valid = false
  end

  # def card_type_finder()
  #   if card_number.length == 16
  #     "VISA"
  #   elsif card_number.length == 15
  #     "Amex"
  #   end
  # end

  # def print_card_type(card_type)
  #     puts "Checked a #{card_type} card"
  # end

  def double_select_digits()
    digits_doubled = []
    #card_type = card_type_finder(card_number)
    @card_number.length.times do |time| #<- try to rewrite with map
      if @card_number.length == (time + 1)
        @digits_doubled << @card_number[time]
      elsif time%2 == @card_number.length%2
        @digits_doubled << (@card_number[time] * 2)
      else
        @digits_doubled << @card_number[time]
      end
    end
    # return digits_doubled
  end

  def fix_greater_than_nine()
    # digits_fixed = []
    @digits_doubled.each do |digit|
      if digit > 9
        @digits_fixed << (digit - 9)
      else
        @digits_fixed << digit
      end
    end
    # return digits_fixed
  end

  def check_sum()
    if @digits_fixed.sum % 10 == 0
      @valid = true
    end
  end

  def check_valid()
    if @valid
      puts "The card is valid!"
    else
      puts "The card is invalid!"
    end
  end

  def run_credit_checker()
    double_select_digits()
    fix_greater_than_nine()
    check_sum()
    # print_card_type(card_type_finder)
    check_valid()
  end
end
