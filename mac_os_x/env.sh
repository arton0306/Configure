# install homebrew
# refs => http://brew.sh/
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew doctor

# install automake
brew install automake

# install screen and enable 256 color
# os x disable 256 color screen in default
# refs => http://apple.stackexchange.com/questions/39608/running-gnu-screen-with-256-colors-on-os-x-lion
git clone git://git.savannah.gnu.org/screen.git
cd screen/src
./autogen.sh
./configure --enable-colors256
make
sudo make install

