require 'spec_helper'
describe 'foxjava' do

  context 'with defaults for all parameters' do
    it { should contain_class('foxjava') }
  end
end
