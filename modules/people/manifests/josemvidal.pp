class people::josemvidal {

  include gitx
  include iterm2::stable
  include dropbox
  include chrome
  include vagrant
  include github_for_mac
  include evernote
  include emacs
  include android::sdk
  include android::ndk
  include android::tools
  include android::platform_tools
  android::extra { 'extra-google-google_play_services': }
  include android::doc
  #Had to install Java 1.6 from https://support.apple.com/kb/DL1572?viewlocale=en_US&locale=en_US
  # to get android studio to run
  include android::studio
  include android::19
  include android::21
  include virtualbox
  include java
  include googledrive
  include calibre
  include dash
  include fantastical
  include skitch
  include flux
  include fonts
#  include utorrent

  #setup my node version
  class { 'nodejs::global': version => 'v0.10.31' }

  # Mysql important info
  # ATTENTION Boxen uses a non standard 13306 port to avoid collisions.
  # Once installed, you can access the following variables in your environment, projects, etc:

  #   BOXEN_MYSQL_PORT: the configured MySQL port
  #   BOXEN_MYSQL_URL: the URL for MySQL, including localhost & port
  #   BOXEN_MYSQL_SOCKET: the path to the MySQL socket
  include mysql
  mysql::db { 'mydb': }

  package { 'hyperswitch':
    provider => 'compressed_app',
    source   => 'http://bahoom.com/hyperswitch/HyperSwitch.zip'
  }

  package { 'RubyMine':
    provider => 'appdmg',
    source   => "http://download.jetbrains.com/ruby/RubyMine-7.0.4.dmg",
  }

  $recovery_message = "If found, please email jmvidal@gmail.com"
  osx::recovery_message { $recovery_message: }

  include osx::global::tap_to_click


  $homebrew_packages = [
                        'tree',
                        'curl',
                        'gawk',
                        'wget',
                        'nmap',
                        'tmux',
                        'rust',
                        'libxml2',
                        'imagemagick',
                        'mosh',
                        'lastpass-cli'
                        ]

  ## Declare all Homebrew packages at once
  package { $homebrew_packages: }

  # setup my symlinks.

  # $::luser and $::boxen_srcdir come from Boxen's custom facts
  $my_username  = $::luser
  $homedir   = "/Users/${my_username}"

  file { "${homedir}/.emacs.bmk":
    ensure => 'link',
    target => "${homedir}/Google\ Drive/share/dotfiles/.emacs.bmk"
  }

  file { "${homedir}/.emacs.d":
    ensure => 'link',
    target => "${homedir}/Google\ Drive/share/prelude"
  }

  file { "${homedir}/.gitconfig":
    ensure => 'link',
    target => "${homedir}/Google\ Drive/share/dotfiles/.gitconfig"
  }

  file { "${homedir}/.profile":
    ensure => 'link',
    target => "${homedir}/Google\ Drive/share/dotfiles/.profile"
  }

  file { "${homedir}/bin":
    ensure => 'link',
    target => "${homedir}/Google\ Drive/share/bin"
  }

  file { "${homedir}/prelude":
    ensure => 'link',
    target => "${homedir}/Google\ Drive/share/prelude"
  }

  file { "${homedir}/progs":
    ensure => 'link',
    target => "${homedir}/Google\ Drive/share/progs"
  }

  file { "${homedir}/wp":
    ensure => 'link',
    target => "${homedir}/Google\ Drive/share/wp"
  }

  # $my       = "${home}/my"
  # $dotfiles = "${my}/dotfiles"

  # file { $my:
  #   ensure  => directory
  # }

  # repository { $dotfiles:
  #   source  => 'jbarnette/dotfiles',
  #   require => File[$my]
  # }
}
