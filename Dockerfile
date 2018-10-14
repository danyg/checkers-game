FROM node:8.12.0

RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm i -g npm@6.1.0 &&\
  npm i -g yarn

ENV HOME=/home/app
ADD . $HOME/checkers-game
RUN chown -R app:app $HOME

USER app
WORKDIR $HOME/checkers-game
RUN ls -la
RUN yarn install
RUN ls -la ./node_modules
# RUN node ./core_opener.js
