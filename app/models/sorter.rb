class Sorter
  def initialize(people:, field:)
    @people = people
    @field = field
  end

  def sort
    @people.sort_by { |person| person.send(@field) }
  end
end
