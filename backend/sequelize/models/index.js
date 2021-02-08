//Conexion con la Base de Datos.
import Sequelize from 'sequelize'


const sequelize = new Sequelize('bd_prueba', 'root', 'carloseduardo0', {  //Modifica los datos para conectarte a la Bd
    host: 'localhost',
    dialect: 'mysql',
    define: {
        timestamps: false
    }
});

const models = {
    propietario: sequelize.import('./propietario'),
    factura: sequelize.import('./factura'),
    condominio: sequelize.import('./condominio'),
    edificio: sequelize.import('./edificio'),
    lugarOcio: sequelize.import('./lugarOcio')
}


models.sequelize = sequelize
models.Sequelize = Sequelize

module.exports = models