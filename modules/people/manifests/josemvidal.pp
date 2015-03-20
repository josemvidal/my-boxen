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
  include virtualbox
  include java
  include googledrive
  include calibre
  include dash
  include fantastical
  include skitch
  include flux

  package { 'hyperswitch':
    provider => 'compressed_app',
    source   => 'http://bahoom.com/hyperswitch/HyperSwitch.zip'
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
                        'imagemagick'
                        ]

  ## Declare all Homebrew packages at once
  package { $homebrew_packages: }



  # include virtualbox
  # include java
  # include intellij
  # include eclipse
  # include android
  # include calibre
  # include evernote
  # include python
  # include googledrive

  # $Home     = "/Users/${::boxen_user}"
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
