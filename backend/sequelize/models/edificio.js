module.exports = (sequelize, DataTypes) => {
    const Edificio = sequelize.define('Edificio', {
        nombre: {
            type: DataTypes.STRING,
            primaryKey: true
        },

    }, {});
    return Edificio
}