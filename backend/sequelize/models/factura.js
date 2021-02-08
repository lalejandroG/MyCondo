module.exports = (sequelize, DataTypes) => {
    const Factura = sequelize.define('Factura', {

        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        concepto : {
            type: DataTypes.STRING,
            allowNull: false
        },
        descripcion: {
            type: DataTypes.STRING,
            allowNull: false

        },
        monto: {
            type: DataTypes.INTEGER,
            allowNull: false
        },   

    }, {});
    return Factura
}