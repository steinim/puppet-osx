# Public: Disables the dock by setting a long autohide-delay
class osx::dock::no_bouncing {
  include osx::dock

  boxen::osx_defaults { 'Prevent bouncing applications in dock':
    user   => $::boxen_user,
    key    => 'no-bouncing',
    type   => 'bool',
    domain => 'com.apple.dock',
    value  => true,
    notify => Exec['killall Dock'];
  }
}
