const express = require('express');
const cors = require('cors');
const { connectDB } = require('./db'); // Aquí importamos la nueva función

const app = express();

app.use(cors());
app.use(express.json());

// Aquí ejecutamos la conexión a SQL Server
connectDB();

app.listen(3001, () => {
    console.log('Backend corriendo en el puerto 3001');
});