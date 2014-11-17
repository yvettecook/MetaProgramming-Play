require 'student'

describe Student do

  let(:student) { Student.new }

  it 'does not have an award' do
    expect(student.has_unixoid?).to eq(false)
  end

  it 'can have badges awards' do
    student.award :unixoid
    expect(student).to have_unixoid
  end

end
