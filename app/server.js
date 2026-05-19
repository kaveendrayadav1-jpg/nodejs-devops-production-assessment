const express = require('express');
const app = express();

app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'UP'
  });
});

app.listen(3000, () => {
  console.log('Application running on port 3000');
});
