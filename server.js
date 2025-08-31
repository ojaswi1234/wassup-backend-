// server.js
const http = require('http');
const { Server } = require('socket.io');
const server = http.createServer();
const io = new Server(server, { cors: { origin: '*' } });
const express = require('express');

app.use(express.json());

app.get('/health', (req, res) => {
  res.status(200).json({ 
    status: 'healthy',
    timestamp: new Date().toISOString(),
    connections: io.engine.clientsCount,
    uptime: process.uptime(),
    memory: process.memoryUsage()
  });
});

// ADD ROOT ROUTE
app.get('/', (req, res) => {
  res.json({ 
    message: 'WassUp Socket.IO Server',
    status: 'running',
    connections: io.engine.clientsCount,
    timestamp: new Date().toISOString()
  });
});


// ADD WAKE ROUTE (for external services to wake up the server)
app.get('/wake', (req, res) => {
  res.status(200).json({ 
    message: 'Server is awake',
    timestamp: new Date().toISOString(),
    connections: io.engine.clientsCount
  });
});
// Store messages for each room
const roomMessages = new Map();

io.on('connection', (socket) => {
  console.log('Client connected:', socket.id);
  
  // Handle joining rooms
  socket.on('join_room', (roomId) => {
    socket.join(roomId);
   
    
    // Send existing messages for this room
    if (roomMessages.has(roomId)) {
      socket.emit('messages', roomMessages.get(roomId));
    }
  });
  
  // Handle messages
  socket.on('message', (data) => {
    console.log('Message received:', data);
    
    const { room, message } = data;
    
    if (!room || !message) {
      console.error('Invalid message format:', data);
      return;
    }
    
    // Store message in room
    if (!roomMessages.has(room)) {
      roomMessages.set(room, []);
    }
    roomMessages.get(room).push(message);
    
    // Broadcast to room
    io.to(room).emit('message', message);
    console.log(`Message sent to room ${room}:`, message);
  });
  
  // Handle getting messages for a room
  socket.on('get_messages', (data) => {
    const roomId = data.room || 'UserA-UserB'; // Default room
    if (roomMessages.has(roomId)) {
      socket.emit('messages', roomMessages.get(roomId));
    } else {
      socket.emit('messages', []);
    }
  });
  
  socket.on('disconnect', () => {
    console.log('Client disconnected:', socket.id);
  });
  
  socket.on('isSeen', (data) => {
    console.log('isSeen event received:', data);
    // Handle the isSeen event
    if (data.isSeen) {
      socket.emit('status', { status: 'seen' });
    } else if (data.isDelivered) {
      socket.emit('status', { status: 'delivered' });
    } else {
      socket.emit('status', { status: 'error' });
    }
  });
  
});

function keepAlive() {
  const url = 'https://wassup-backend-5isl.onrender.com/health';
  
  setInterval(() => {
    https.get(url, (res) => {
      console.log(`Keep-alive ping: ${res.statusCode} at ${new Date().toISOString()}`);
      console.log(`Active connections: ${io.engine.clientsCount}`);
    }).on('error', (err) => {
      console.log('Keep-alive error:', err.message);
    });
  }, 5 * 60 * 1000); // Ping every 14 minutes (before 15-minute sleep)
}
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log('Socket.IO server running on port 3000');
  console.log('Visit http://localhost:3000 in your browser');
  keepAlive();
});