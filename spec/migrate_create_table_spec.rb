require_relative '../app.rb'


describe "create table with correct schema" do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end

  it "has a Students table" do
    expect(ActiveRecord::Base.connection.table_exists?(:students)).to be_truthy
  end

  it "has the right columns and types" do
    expected = {
      :integer => ["id"],
      :string => ["first_name", "last_name", "gender", "email", "phone"],
      :date => ["birthday"],
      :datetime => ["created_at", "updated_at"]
    }

    ActiveRecord::Base.connection.columns(:students).each do |col|
      expect(expected[col.type]).to include(col.name)
    end
  end
end
