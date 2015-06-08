require_relative '../app.rb'


describe Student, "internationalized" do

  it "has a name attribute" do
    student = Student.all.first
    student.name = "John Doe"
    student.save!
    student = Student.find(student.id)
    expect(student.name).to eq("John Doe")
  end

  it "has an address field" do
    student = Student.new
    expect(-> {
      student.update_attributes(
        :name => "Jane Doe",
        :gender => "female",
        :birthday => Time.new(1973, 01, 01),
        :email => "jane.doe@example.com",
        :phone => "510-555-1212",
        :address => "123 4th St New York NY 10101"
      )
    }).to_not raise_error
  end

  it "contains correct sample data" do
    expect(Student.where("name = ?", "Karim Bishay").count).to be >= 1
  end

end
