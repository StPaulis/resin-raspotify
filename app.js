var exec = require('child_process').exec;
const fs = require('fs');

function execString(msg) {
  exec(msg,
    function (error, stdout, stderr) {
      if (error !== null) {
        console.log('exec error: ' + error);
      }
    });
  console.log(`exec: ${msg}`)
}

function restart() {
  execString('systemctl restart raspotify');
};

fs.appendFileSync('/etc/default/raspotify', 
  `
DEVICE_NAME="resin-raspotify"
BITRATE="320"
OPTIONS=--username ${process.env.USERNAME} --password ${process.env.PASSWORD} >> /etc/default/raspotify`);

execString('systemctl enable raspotify');
restart();
setInterval(restart, 21600000);
