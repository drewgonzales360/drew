FROM ubuntu:18.04


RUN apt-get update && \
apt-get install -y zsh curl git wget sudo && \
useradd -ms /bin/zsh drew

USER drew

ENV ZSH_CUSTOM=/home/drew/.oh-my-zsh/custom
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true && \
wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -O $ZSH_CUSTOM/themes/bullet-train.zsh-theme

COPY zshrc /home/drew/.zshrc

ENTRYPOINT /bin/zsh
CMD sleep infinity
