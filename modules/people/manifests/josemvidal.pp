class people::josemvidal {

  include gitx
  include iterm2::stable
  include dropbox
  include chrome
  include vagrant
  include github_for_mac


  $recovery_message = "If found, please email jmvidal@gmail.com"
  osx::recovery_message { $recovery_message: }

  include osx::global::tap_to_click

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
