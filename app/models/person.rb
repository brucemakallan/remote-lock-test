require 'date'
require_relative 'cities'

class Person
  attr_accessor :city, :birth_date, :last_name, :first_name

  def initialize(city:, birth_date:, last_name:, first_name:)
    @last_name = last_name || ''
    @first_name = first_name || ''
    @city = convert_city(city)
    @birth_date = convert_date(birth_date)
  end

  def to_s
    "#{first_name}, #{city}, #{birth_date}"
  end

  private

  def convert_city(name)
    Cities.all[name] || name
  end

  def convert_date(value)
    date = Date.parse(value)

    "#{date.mon}/#{date.mday}/#{date.year}"
  end
end
