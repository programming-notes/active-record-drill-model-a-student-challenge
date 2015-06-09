require_relative '../spec_helper'

describe 'database students table' do
  it 'has a students table' do
    students_table = ActiveRecord::Base.connection.table_exists?(:students)
    expect(students_table).to be_truthy
  end

  it 'has named columns of the right types' do
    expected_column_types_and_names = {
      :integer  => ['id'],
      :string   => ['first_name', 'last_name', 'phone'],
      :date     => ['birthday'],
      :datetime => ['created_at', 'updated_at']
    }

    actual_columns = ActiveRecord::Base.connection.columns(:students)

    expected_column_types_and_names.each do |expected_type, expected_column_names|
      expected_column_names.each do |expected_column_name|
        match_criteria = -> (actual_column) { actual_column.type == expected_type && actual_column.name == expected_column_name}
        matching_column = actual_columns.find &match_criteria
        expect(matching_column).to be_truthy
      end
    end
  end
end
