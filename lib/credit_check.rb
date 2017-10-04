

# Your Luhn Algorithm Here
#class credit_number_checker (card_number, valid)

def card_number_to_usable(card_number)
  card_number = card_number.to_i.digits.reverse
end

def card_type_finder(card_number)
  if card_number.length == 16
    card_type = "VISA"
  elsif card_number.length == 15
    card_type = "Amex"
  end
end


#need to restructure to allow for different card lengths
#should rethink the if statements

def double_select_digits(card_number)
  digits_doubled = []
  #card_type = card_type_finder(card_number)
  card_number.length.times do |time| #<- try to rewrite with map
    if card_number.length == (time + 1)
      digits_doubled << card_number[time]
    elsif time%2 == card_number.length%2
      digits_doubled << (card_number[time] * 2)
    else
      digits_doubled << card_number[time]
    end
  end
  return digits_doubled
end

def fix_greater_than_nine(digits_doubled)
  digits_fixed = []
  digits_doubled.each do |digit|
    if digit > 9
      digits_fixed << (digit-9)
    else
      digits_fixed << digit
    end
  end
  return digits_fixed
end

def check_sum(digits_fixed)
  puts digits_fixed.sum
  if digits_fixed.sum % 10 == 0
    valid = true
  else
    valid = false
  end
  return valid
end

def check_valid(valid)
  if valid
    puts "The card is valid!"
  else
    puts "The card is invalid!"
  end
end

def run_credit_checker(card_number)
  digits_doubled = double_select_digits(card_number_to_usable(card_number))
  digits_fixed = fix_greater_than_nine(digits_doubled)
  valid = check_sum(digits_fixed)
  check_valid(valid)
end

card_number = "342801633855673"
run_credit_checker(card_number)

# Output
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"
