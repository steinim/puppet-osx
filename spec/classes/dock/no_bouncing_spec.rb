require 'spec_helper'

describe 'osx::dock::no_bouncing' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')

    should contain_boxen__osx_defaults('Prevent bouncing applications in dock').with({
      :key    => 'no-bouncing',
      :type   => 'bool',
      :domain => 'com.apple.dock',
      :value  => 'true',
      :notify => 'Exec[killall Dock]',
      :user   => facts[:boxen_user]
    })
  end
end
