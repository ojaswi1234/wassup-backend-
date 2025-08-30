// server.js
const http = require('http');
const { Server } = require('socket.io');
const server = http.createServer();
const io = new Server(server, { cors: { origin: '*' } });

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

  // Handle user details request
  socket.on('get_user_details', (data) => {
    const userDetails = {
      id: socket.id,
      name: data?.name || `User-${socket.id.slice(0, 6)}`,
      status: socket.connected ? 'Online' : 'Offline'
    };
    console.log('Sending user details:', userDetails);
    socket.emit('user_details', userDetails);
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
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log('Socket.IO server running on port 3000');
  console.log('Visit http://localhost:3000 in your browser');
});