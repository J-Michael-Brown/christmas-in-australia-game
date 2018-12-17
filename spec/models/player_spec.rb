require 'rails_helper'

describe Player do

  it { should have_many :items }
  it { should have_many :locations }
  it { should have_many :objectives }


end
