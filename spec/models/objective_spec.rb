require 'rails_helper'

describe Objective do
  it { should have_many :locations }
  it { should belong_to :player }

end
