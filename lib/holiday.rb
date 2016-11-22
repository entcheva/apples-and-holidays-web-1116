require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |key, value|
    if key == :winter
      value.each do |key2, value2|
        value2 << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end


def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end


def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end


def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |seasons, holidays|
    puts "#{seasons.to_s.capitalize}:"
    holidays.each do |holiday, supplies|
      formatted_holiday = holiday.to_s.split("_").join(" ").split
      formatted_holiday.each do |word|
        word.capitalize!
      end
      formatted_holiday = formatted_holiday.join(" ")
      puts "  " + formatted_holiday + ": " + supplies.join(", ")
    end
  end
end



def all_holidays_with_bbq(holiday_hash)
  bbq = []

  holiday_hash.each do |seasons, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        bbq.push(holiday)
      end
    end
  end
  bbq
end
