FROM ubuntu:16.04


RUN apt-get update && \
apt-get install -y zsh vim curl git wget sudo iputils-ping && \
useradd -ms /bin/zsh drew && \
echo "drew ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER drew

ENV ZSH_CUSTOM=/home/drew/.oh-my-zsh/custom
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true && \
wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -O $ZSH_CUSTOM/themes/bullet-train.zsh-theme && \
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && \
sh ~/.vim_runtime/install_awesome_vimrc.sh

COPY zshrc ~/.zshrc

ENTRYPOINT /bin/zsh
