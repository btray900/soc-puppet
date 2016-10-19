require 'spec_helper'
describe 'packetbeat' do

  context 'with defaults for all parameters' do
    it { should contain_class('packetbeat') }
  end
end
