<img alt="icon" src=".diploi/icon.svg" width="32">

# Node.js Component for Diploi

A generic Node.js component that can be used to run any Node.js app.

Uses the official [node](https://hub.docker.com/_/node) Docker image.

## Operation

### Development

Will run `npm install` when component is first initialized, and `npm run dev` when deployment is started.

### Production

Will build a production ready image. Image runs `npm install` & `npm build` when being created. Once the image runs, `npm start` is called.
