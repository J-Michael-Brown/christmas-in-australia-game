require 'rails_helper'

describe Item do
  it { should belong_to :location }
  it { should belong_to :player }
end
