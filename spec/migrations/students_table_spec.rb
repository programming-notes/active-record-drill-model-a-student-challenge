require_relative '../spec_helper'

describe "database students table" do
  it "has a students table" do
    students_table = ActiveRecord::Base.connection.table_exists?(:students)
    expect(students_table).to be_truthy
  end

  it "has the right columns of the right types" do
    expected_column_types_and_names = {
      :integer  => ["id"],
      :string   => ["first_name", "last_name", "phone"],
      :date     => ["birthday"],
      :datetime => ["created_at", "updated_at"]
    }

    ActiveRecord::Base.connection.columns(:students).each do |col|
      expect(expected[col.type]).to include(col.name)
    end
  end
end
