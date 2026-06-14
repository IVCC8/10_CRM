require('dotenv').config();
const sql = require('mssql/msnodesqlv8');

const dbConfig = {
  connectionString: "Driver={SQL Server};Server=localhost;Database=CRM;Trusted_Connection=true;"
};

const connectDB = async () => {
  try {
    const pool = await sql.connect(dbConfig);
    console.log('¡Conexión a SQL Server exitosa!');
    return pool;
  } catch (error) {
    console.error('Error al conectar:', error.message);
  }
};

module.exports = { connectDB };