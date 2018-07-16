#!/usr/bin/env bash

set -e -u -o pipefail

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install gnu-sed --with-default-names
brew install grep
brew install openssh
brew install screen
# brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg # git repo cleaner
brew install binutils
brew install binwalk
brew install cifer
# brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack # grep substitute
brew install ag # grep substitute
brew install curl
brew install direnv
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install jq --HEAD # json on the command line
brew install lua
brew install lynx
brew install p7zip
brew install pigz # gzip for multi-cores
brew install pstree
brew install pv # pipeviewer allows to display throughput/eta information on unix pipes
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tmux
brew install tree
brew install vbindiff
brew install watch
# brew install zopfli

# Install homebrew-casks
brew tap caskroom/cask
# spectacle for osx window management/tiling
brew cask install spectacle
# virtualbox to handle vms
brew cask install virtualbox
# flux to reduce blue/green colors on the display spectrum
brew cask install flux
# slack to chat with teammates
brew cask install slack
# itsyscal to replace menu bar clock
brew cask install itsyscal
# macdown to edit markdown
brew cask install macdown
# dash for offline documentation
brew cask install dash
# docker for containers
brew cask install docker

# Remove outdated versions from the cellar.
brew cleanup
