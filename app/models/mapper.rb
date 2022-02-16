require_relative 'formats'
require_relative 'person'

# Combine the entries from the different formats
class Mapper
  include Formats

  def initialize(format:, file:)
    @format = format
    @file = file
  end

  def people
    people = []

    lines.each_with_index do |line, i|
      next if i == 0 # skip heading

      mapping = map(line)
      person = Person.new(
        first_name: mapping[:first_name],
        last_name: mapping[:last_name],
        city: mapping[:city],
        birth_date: mapping[:birthdate],
      )

      people.push(person)
    end

    people
  end

  private

  def lines
    @file.split("\n")
  end

  def map(line)
    headings = lines.first.split(@format)
    attributes = line.split(@format)

    {
      headings[0]&.strip&.to_sym => attributes[0]&.strip,
      headings[1]&.strip&.to_sym => attributes[1]&.strip,
      headings[2]&.strip&.to_sym => attributes[2]&.strip,
      headings[3]&.strip&.to_sym => attributes[3]&.strip,
    }
  end
end
