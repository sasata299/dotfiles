# for install homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# brew doctor

update
upgrade

tap homebrew/versions || true
tap homebrew/binary || true

tap caskroom/cask || true
tap phinze/homebrew-cask || true
install brew-cask

# for nokogiri
# tap homebrew/dupes
# install libxml2 libxslt libiconv

# これも忘れずにやること
# bundle config build.nokogiri --with-xml2-include=/usr/local/Cellar/libxml2/2.9.1/include/libxml2 --with-xml2-lib=/usr/local/Cellar/libxml2/2.9.1/lib  --with-xslt-dir=/usr/local/Cellar/libxslt/1.1.28  --with-iconv-include=/usr/local/Cellar/libiconv/1.14/include  --with-iconv-lib=/usr/local/Cellar/libiconv/1.14/lib
# 結果が ~/.bundle/config に書かれるので、変な改行を取り除いて一行にするのを忘れずに!!

install rbenv
install ruby-build
install curl
install openssl
install zsh
install git
install mysql
install tmux
install jq
install readline
install imagemagick
install redis
install mongodb
install hub

cask install java7
cask install virtualbox
cask install vagrant
cask install google-chrome
cask install dropbox
cask install evernote
cask install bettertouchtool
cask install licecap
cask install skype
cask install sequel-pro
cask install sublime-text
cask install alfred
cask alfred link

cleanup
