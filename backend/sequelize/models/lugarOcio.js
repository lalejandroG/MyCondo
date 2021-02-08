module.exports = (sequelize, DataTypes) => {
    const LugarOcio = sequelize.define('LugarOcio', {
        nombre: {
            type: DataTypes.STRING,
            primaryKey: true,
            allowNull: false
        },
        estado: {
            type: DataTypes.STRING,
            allowNull: false
        }

    }, {});
    return LugarOcio
}