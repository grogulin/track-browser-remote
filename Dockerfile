# FROM node:ubuntu
# FROM --platform=linux/amd64 ubuntu
FROM --platform=linux/amd64 node:12.18.1
# set working direction
WORKDIR /app
# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install application dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm i
# EXPOSE 80
EXPOSE 9900

# add app
COPY . ./

# start app
# CMD ["npm", "start", "& > mylog.out"]
CMD ["pm2", "start", "bin/www"]
# CMD ["node", "app.js"]
