print ("What is the amount being invested?\n")
print ("> ")
amount = gets.chomp.to_f

print ("What is the annual interest rate?\n")
print ("> ")
percent = gets.chomp.to_f
percentage = percent / 100
puts("#{percentage}")

print ("How many years will it accrue interest?\n")
print ("> ")
years = gets.chomp.to_i

# FV = PV(i + 1) ** n 
def compound_me(amount, percentage, years)
  calc_percent = percentage + 1
  compound = calc_percent ** years
  final_value = compound * amount
  return final_value
end 

total = compound_me(amount, percentage, years)

printf("The final value will be $%.2f after %d years.\n", total, years)
puts("-" * 20 )

# Calculate and report value for every year of accural
def compound_years(amount, percentage, years)
  year = 1
  year_total = year_calc(amount, percentage)
  report_by_year(year, year_total)
  while year < years
    year = year + 1
    year_total = year_calc(year_total, percentage)
    report_by_year(year, year_total)
  end
end 

# Total value after one year
def year_calc(amount, percentage)
  calc_percent = percentage + 1
  year_total = calc_percent * amount
  return year_total
end 

# Report annual value
def report_by_year(year, year_total)
  printf("Year %d: $%.2f\n",year, year_total)
end 

compound_years(amount, percentage, years)