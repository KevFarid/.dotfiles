echo "Installing PyEnv"
curl https://pyenv.run | bash

echo "Installing Python 3"
# install python 3
pyenv install 3.9.5 #latest
pyenv global 3.9.5


# install fnm
echo "Installing fnm"
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash

# install Paq - Neovim Plugin Manager
echo "Installing Neovim Plugin Manager \(Packer\)"
git clone https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/opt/paq-nvim

alias vim="nvim"

pip3 install pynvim

echo "Installing last version of nodejs"
fnm install

echo "Creating workspace folder in Home"
mkdir ~/workspace

echo "Configuring git user..."
git config --global user.name "Kevin Cruz"
git config --global user.email "dev@kevinfarid.com"


echo "Creating ssh key"
ssh-keygen -t ed25519 -C "dev@kevinfarid.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519


echo "Creating folders for Golang"
mkdir -p ${HOME}/go/{bin,src,pkg}
