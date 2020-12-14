const express = require('express');
const dotenv = require('dotenv');

const app = express();

app.get('/', (req, res) => {
  res.send('Frontend:' + Date.now())
})

dotenv.config();
var port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log('App listening on port: ' + port);
}) 