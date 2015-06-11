require_relative '../spec_helper'

describe Student do
  describe 'attributes' do
    let(:student) { Student.new(first_name: 'Tad', last_name: 'Hall', birthday: Date.new(1991, 04, 18), phone: '419-555-4938') }

    it 'has a readable and writable first name' do
      expect(student.first_name).to eq 'Tad'
      student.first_name = 'Drake'
      expect(student.first_name).to eq 'Drake'
    end

    it 'has a readable and writable last_name' do
      expect(student.last_name).to eq 'Hall'
      student.last_name = 'Zilberschlag'
      expect(student.last_name).to eq 'Zilberschlag'
    end

    it 'has a readable and writable birthday' do
      expect(student.birthday).to eq Date.new(1991, 04, 18)
      student.birthday = Date.new(1993, 04, 20)
      expect(student.birthday).to eq Date.new(1993, 04, 20)
    end

    it 'has a readable and writable phone number' do
      expect(student.phone).to eq '419-555-4938'
      student.phone = '419-555-3981'
      expect(student.phone).to eq '419-555-3981'
    end

    context 'before being saved' do
      it 'has no id' do
        expect(student.id).to be_nil
      end

      it 'has no created_at timestamp' do
        expect(student.created_at).to be_nil
      end

      it 'has no updated_at timestamp' do
        expect(student.updated_at).to be_nil
      end
    end

    context 'after being saved' do
      before(:each) { student.save }

      it 'has an id' do
        expect(student.id).to_not be_nil
      end

      it 'has a created_at timestamp' do
        expect(student.created_at).to_not be_nil
      end

      it 'has an updated_at timestamp' do
        expect(student.updated_at).to_not be_nil
      end
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
        let(:ten_years_ago) { Date.today - 10.years }
        let(:ten_years_and_one_day_ago) { ten_years_ago - 1.day }
        let(:one_day_shy_of_ten_years_ago) { ten_years_ago + 1.day }

        context 'has birthday today' do
          it 'correctly calculates the students age' do
            student = Student.new(birthday: ten_years_ago)
            expect(student.age).to eq 10
          end
        end

        context 'had a birthday yesterday' do
          it 'correctly calculates the students age' do
            student = Student.new(birthday: ten_years_and_one_day_ago)
            expect(student.age).to eq 10
          end
        end

        context 'has a birthday tomorrow' do
          it 'correctly calculates the students age' do
            student = Student.new(birthday: one_day_shy_of_ten_years_ago)
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
      three_years_ago = Date.today - 3.years
      less_than_three_years_ago = three_years_ago + 1.day

      student.birthay = three_years_ago
      expect(student).to be_valid

      student.birthday = less_than_three_years_ago
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
