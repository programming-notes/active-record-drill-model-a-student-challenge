require_relative '../app.rb'


describe "add timestamps" do
  it "has the right columns and types" do
    found_created_at = found_updated_at = false
    ActiveRecord::Base.connection.columns(:students).each do |col|
      case col.name
      when "created_at"
        found_created_at = true
        expect(col.type).to eq(:datetime)
      when "updated_at"
        found_updated_at = true
        expect(col.type).to eq(:datetime)
      end
    end
    expect(found_created_at && found_updated_at).to be_truthy
  end
end
