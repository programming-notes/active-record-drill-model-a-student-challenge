require_relative '../spec_helper'

describe Student do
  describe "attributes" do
    attributes = [:first_name, :last_name, :birthday, :phone]

    let(:student) { Student.new(first_name: 'Tad', last_name: 'Hall', birthday: Date.new(1991, 04, 18), phone: '419-555-4938') }

    it "has a readable and writable first name" do
      expect(student.first_name).to eq 'Tad'
      student.first_name = 'Drake'
      expect(student.first_name).to eq 'Drake'
    end

    it "has a readable and writable last_name" do
      expect(student.last_name).to eq 'Hall'
      student.last_name = 'Zilberschlag'
      expect(student.last_name).to eq 'Zilberschlag'
    end

    it "has a readable and writable birthday" do
      expect(student.birthday).to eq Date.new(1991, 04, 18)
      student.birthday = Date.new(1993, 04, 20)
      expect(student.birthday).to eq Date.new(1993, 04, 20)
    end

    it "has a readable and writable phone number" do
      expect(student.phone).to eq '419-555-4938'
      student.phone = '419-555-3981'
      expect(student.phone).to eq '419-555-3981'
    end

    describe 'virtual attributes' do
      describe '#name' do
        it 'concatenates the first name and the last name' do
          expect(student.name).to eq 'Tad Hall'
        end
      end

      describe '#name=' do
        it 'sets the first name and last name' do
          expect(student.first_name).to eq 'Tad'
          expect(student.last_name).to eq 'Hall'
          student.name = 'Thamir Selby'
          expect(student.first_name).to eq 'Thamir'
          expect(student.last_name).to eq 'Selby'
        end
      end

      describe '#age' do
        context 'has had birthday already this year' do
          it "correctly calculates the students age based on today's date" do
            allow(Date).to receive(:today).and_return Date.new(2001, 04, 19)
            expect(student.age).to eq 10
          end
        end

        context 'has not had birthday already this year' do
          it "correctly calculates the students age based on today's date" do
            allow(Date).to receive(:today).and_return Date.new(2001, 04, 17)
            expect(student.age).to eq 9
          end
        end
      end
    end
  end


  describe "validations" do
    let(:student) { Student.new(first_name: 'Shayla', last_name: 'Messerli', birthday: Date.new(1980, 02, 01), phone: '419-555-0987') }

    it "accepts valid info" do
      expect(student).to be_valid
    end

    it "only allows students at least three years old" do
      allow(Date).to receive(:today).and_return Date.new(2003, 01, 01)

      student.birthday = Date.new(2000, 01, 01)
      expect(student).to be_valid

      student.birthday = Date.new(1999, 12, 31)
      expect(student).to_not be_valid
    end

    it "requires phone number to have at least ten digits" do
      student.phone = '1234567890'
      expect(student).to be_valid

      student.phone = '123-456-789'
      expect(student).to_not be_valid

      student.phone = '123456789123456789'
      expect(student).to be_valid
    end
  end
end
