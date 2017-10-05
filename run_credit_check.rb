require "./lib/credit_check"

valid_numbers = [5541808923795240,
                 4024007136512380,
                 6011797668867828,
                 342804633855673]

invalid_numbers = [5541801923795240,
                   4024007106512380,
                   6011797668868728,
                   342801633855673]
                   
valid_numbers.each do |valid_number|
  card_number = CreditCard.new(valid_number)
  card_number.run_credit_checker
end

invalid_numbers.each do |invalid_number|
  card_number = CreditCard.new(invalid_number)
  card_number.run_credit_checker
end
