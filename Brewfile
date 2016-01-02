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
tap homebrew/dupes
install libxml2 libxslt libiconv

# これも忘れずにやること
# 結果が ~/.bundle/config に書かれるので、変な改行を取り除いて一行にするのを忘れずに!!
bundle config build.nokogiri --with-xml2-include=/usr/local/Cellar/libxml2/2.9.1/include/libxml2 --with-xml2-lib=/usr/local/Cellar/libxml2/2.9.1/lib  --with-xslt-dir=/usr/local/Cellar/libxslt/1.1.28  --with-iconv-include=/usr/local/Cellar/libiconv/1.14/include  --with-iconv-lib=/usr/local/Cellar/libiconv/1.14/lib

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
install redis
install mongodb
install qt
install hub
# install vim
# sudo ln -s /usr/local/Cellar/vim/7.4.161/bin/vim /usr/bin/
install imagemagick
install node
install ansible

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
