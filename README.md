## Node-RED packaging for Cloudron.io

[Node-RED](http://nodered.org/) is a web-based tool for wiring together APIs and functions with boxes and wires. But Node-RED is a self-hosted app. If you don't want to host it yourself, thanks to this port you can launch a remote instance for you using [Cloudron.io](https://cloudron.io/).

It's currently a single user app (meaning that within one instance everybody sees everything). The recommended use is to create a dedicated app instance per user or team.

# Try it online

Easy! Go to [Cloudron.io](https://cloudron.io/) and click on Demo. Then install or use an existing demo instance of Node-RED.

# Build and run locally

Assuming you have Docker installed:

```
git clone https://github.com/mlopezr/nodered-cloudron.git
cd nodered-cloudron
docker build -t mynodered .
docker run -it -p 1880:1880 mynodered
```

Then open http://localhost:1880 in your browser.

# What's inside?

The latest version of Node-RED plus the following extensions:

* node-red-contrib-nexmo
