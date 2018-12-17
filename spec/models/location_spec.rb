require 'rails_helper'

describe Location do
  it { should belong_to :objective }
  it { should have_one :item }

end
