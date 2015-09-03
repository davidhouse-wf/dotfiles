# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils
# Install Bash 4
install bash

# Install wget with IRI support
install wget --enable-iri

# Install RingoJS and Narwhal
# Note that the order in which these are installed is important; see http://git.io/brew-narwhal-ringo.
install ringojs
install narwhal

# Install more recent versions of some OS X tools
install vim --override-system-vim --override-system-vi --python3
tap homebrew/dupes
install homebrew/dupes/grep
# install php55

# This formula didn’t work well last time I tried it:
#install homebrew/dupes/screen

# Install other useful binaries
install ack
#install exiv2
install git
install imagemagick --with-webp
install lynx
install node
install pigz
install rename
install rhino
install tree
install webkit2png
install zopfli
install p7zip

#tap homebrew/versions
#install lua52

# David additions
install pkg-config
install llvm --with-clang
install libpng
install autoconf
install automake
install poppler --with-glib
install -v fontforge --with-cairo --with-czmq --with-git --with-x --with-libspiro --enable-pyextension --with-python
install ncurses
install the_silver_searcher

# Remove outdated versions from the cellar
cleanup
