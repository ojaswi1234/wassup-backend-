// server.js
const http = require('http');
const { Server } = require('socket.io');
const server = http.createServer();
const io = new Server(server, { cors: { origin: '*' } });

io.on('connection', (socket) => {
  console.log('Client connected');
  
  socket.on('message', (msg) => {
    console.log('Message received:', msg);
    io.emit('message', msg);
  });
  
  socket.on('disconnect', () => {
    console.log('Client disconnected');
  });
});
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log('Socket.IO server running on port 3000');
  console.log('Visit http://localhost:3000 in your browser');
});