require 'spec_helper'

describe 'bosun' do
  describe command('bosun -version') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /bosun version/ }
  end
end
