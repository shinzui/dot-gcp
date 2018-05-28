#!/usr/bin/env bash
#
# shinzui/gcp ellipsis package

pkg.install() {
  brew cask install google-cloud-sdk
  gcloud components install beta alpha gsutil pubsub-emulator

  install_sql_proxy
}

install_sql_proxy() {
  cd /tmp
  curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
  chmod +x cloud_sql_proxy
  mv cloud_sql_proxy /usr/local/bin/
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
