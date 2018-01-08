#!/usr/bin/env bash
#
# shinzui/gcp ellipsis package

pkg.install() {
  brew cask install google-cloud-sdk
  gcloud components install beta alpha gsutil pubsub-emulator
}

# pkg.push() {
#     git.push
# }

pkg.pull() {
    git.pull

    gcloud components update
}

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }

install_app() {
  if test ! $(brew cask list |grep "$app"); then
    echo "installing $app"
    brew cask install --appdir="/Applications" $app
  else
    echo "$app is already installed. Skipping..."
  fi
}
