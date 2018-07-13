# resin-raspotify
Simple app that runs spotify to raspberry-pi-3 through resin.io and gives you the power to control it as a `Spotify Connect` device.

### Usage

After [reading getting started with resin.io and node.js](https://docs.resin.io/learn/getting-started/raspberrypi3/nodejs), create your 
new application on resin.io. (this sample has been tested in raspberrypi-3).

Add the `USERNAME` & `PASSWORD` enviroment variables in your resin.io device from dashboard to connect to spotify with your credentials. 

As the tutorial...
`git remote add resin <USERNAME>@git.resin.io:<USERNAME>/<APPNAME>.git`
`git push resin master -f`

Afte that you should see your `resin-raspotify` on your available devices on spotify. 

### Dependencies

This project is based on [raspotify](https://github.com/dtcooper/raspotify)'s functionality. <3
