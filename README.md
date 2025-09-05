<img alt="icon" src=".diploi/icon.svg" width="32">

# Node.js Component for Diploi

[![launch with diploi badge](https://diploi.com/launch.svg)](https://diploi.com/component/node)
[![component on diploi badge](https://diploi.com/component.svg)](https://diploi.com/component/node)
[![latest tag badge](https://badgen.net/github/tag/diploi/component-nodejs)](https://diploi.com/component/node)

Start a demo environment (No card or registration needed)
https://diploi.com/component/node

A generic Node.js component that can be used to run any Node.js app.

Uses the official [node](https://hub.docker.com/_/node) Docker image.

## Operation

### Getting started

1. In the Dashboard, click **Create Project +**
2. Under **Pick Components**, choose **Node.js**
3. In **Pick Add-ons**, you can add one or multiple databases to your app
4. Choose **Create Repository**, which will generate a new GitHub repo
5. Lastly, click **Launch Stack**

Link to guide (includes additional information)
https://diploi.com/blog/hosting_node_apps

### Development

Will run `npm install` when component is first initialized, and `npm run dev` when deployment is started.

### Production

Will build a production ready image. Image runs `npm install` & `npm build` when being created. Once the image runs, `npm start` is called.

### Notes

- If you are using packages that use native libraries (like `node-canvas` e.g.), it is a good idea to switch the `Dockerfile` and `Dockerfile.dev` to use `node:XX` instead of `node:XX-slim`. You can also add any missing libraries with `RUN apt update && apt install -y <package>` in the dockerfiles.
