require_relative 'models/formats'
require_relative 'models/mapper'
require_relative 'models/sorter'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    dollar_mapper = Mapper.new(format: Formats::DOLLAR, file: @params[:dollar_format])
    percentage_mapper = Mapper.new(format: Formats::PERCENT, file: @params[:percent_format])

    people = dollar_mapper.people + percentage_mapper.people
    sorted_people = Sorter.new(people: people, field: params[:order]).sort

    sorted_people.map(&:to_s)
  end

  private

  attr_reader :params
end
