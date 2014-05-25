require 'spec_helper'

describe Team do
  it { should embed_many(:castaways) }
end
