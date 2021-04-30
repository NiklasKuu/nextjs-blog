FROM mhart/alpine-node:14
ENV NODE_ENV=production

WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY . .
RUN npm run build && chmod a+x /app && adduser -D appuser
USER appuser
EXPOSE 3000
ENTRYPOINT [ "npm", "run", "start" ]