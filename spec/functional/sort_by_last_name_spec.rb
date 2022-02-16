require 'spec_helper'

RSpec.describe 'Functional Test' do
  describe 'dollar and percent formats sorted by last_name' do
    let(:params) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: :last_name,
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'parses input files and outputs normalized data' do
      normalized_people = people_controller.normalize

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(normalized_people).to eq [
        'Mckayla, Atlanta, 5/29/1986',
        'Elliot, New York City, 5/4/1947',
        'Rigoberto, New York City, 1/5/1962',
        'Rhiannon, Los Angeles, 4/30/1974',
      ]
    end
  end
end
