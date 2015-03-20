class people::josemvidal {

  include gitx
  include iterm2
  include osx
  include dropbox
  include chrome
  include vagrant
  include github_for_mac

  # include android::sdk
  # include android::ndk
  # include android::tools
  # include emacs
  # include chrome
  # include iterm2
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
