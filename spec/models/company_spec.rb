require 'rails_helper'

RSpec.describe Company, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url)}
  it { should validate_length_of(:description).is_at_least(5).is_at_most(100)  }

  describe '#change_state' do

    let(:company) { create(:company) }

    it 'cambia a activo si estaba a inactivo' do
      company.state = false
      company.change_state
      expect(company.state).to eq(true)
    end

    it 'cambia a inactivo si estaba activo' do
      company.state = false
      company.change_state
      expect(company.state).to eq(true)
    end
  end

  it 'comparacion de objetos' do
    company1 = create(:company)
    company2 = create(:company)

    expect(company1.url).to eql(company2.url)
  end

end
