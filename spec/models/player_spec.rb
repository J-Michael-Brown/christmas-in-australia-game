require 'rails_helper'

describe Player do

  it { should have_many :items }
  it { should have_many :locations }
  it { should have_many :objectives }

  describe '#holding(player)' do
    it 'returns list of player\'s held items.' do

    end
  end
end
