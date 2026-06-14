@echo off
echo Iniciando configuracion del CRM...

:: 1. Crear estructura
mkdir server
mkdir client\src\api
mkdir client\src\components
mkdir client\src\pages
mkdir client\src\hooks

:: 2. Inicializar Backend
cd server
call npm init -y
call npm install express mssql cors dotenv

:: Crear db.js
echo const sql = require('mssql'); > db.js
echo require('dotenv').config(); >> db.js
echo. >> db.js
echo const config = { user: process.env.DB_USER, password: process.env.DB_PASSWORD, server: process.env.DB_SERVER, database: process.env.DB_DATABASE, options: { encrypt: true, trustServerCertificate: true } }; >> db.js
echo. >> db.js
echo const poolPromise = new sql.ConnectionPool(config).connect().then(pool =^> { console.log('Conectado a SQL'); return pool; }).catch(err =^> console.log(err)); >> db.js
echo module.exports = { sql, poolPromise }; >> db.js

:: Crear index.js base
echo const express = require('express'); const cors = require('cors'); const { poolPromise } = require('./db'); const app = express(); app.use(cors()); app.use(express.json()); app.listen(3001, () =^> console.log('Backend en 3001')); > index.js

cd ..

:: 3. Inicializar Frontend
cd client
call npm create vite@latest . -- --template react
call npm install axios react-router-dom react-hook-form

:: Crear api.js
echo import axios from 'axios'; const api = axios.create({ baseURL: 'http://localhost:3001/api&#39; }); export default api; > src\api\axios.js

cd ..

echo Estructura creada exitosamente.
pause