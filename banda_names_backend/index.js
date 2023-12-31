const { log } = require('console');
const express = require('express');
const path = require('path');
require('dotenv').config();

// App de Express
const app = express();

// Node Server
const server = require('http').createServer(app);
//module.exports.io = require('socket.io')(server);
const io = require('socket.io')(server);

io.on('connection', client => {
    console.log('Cliente Conectado');
    client.on('disconnect', ()=> console.log('Cliente Desconectado'))

    client.on('mensaje', ( payload )=> {
        console.log('Mensaje!!!!', payload);
        io.emit('mensaje', { admin: 'Nuevo mensaje'})
    })
});


// Path Publico

const publicPath = path.resolve(__dirname, 'public');

app.use(express.static(publicPath));


server.listen(process.env.PORT, (err) => {
    if (err) throw new Error(err);

    console.log('Servidor corriendo en puerto!!!', process.env.PORT);
});