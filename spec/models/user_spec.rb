RSpec.describe User, type: :model do
    describe 'relationships' do
      it { should have_many(:schedules) }
    end
  end