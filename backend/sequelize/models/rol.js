module.exports = (sequelize,DataTypes) => {
    const Rol = sequelize.define('rol',{
    
    id: {
     type: DataTypes.INTEGER,
     autoIncrement: true,
     primaryKey: true,
     allowNull: false
    },
    
    rol: {
        type: DataTypes.STRING(45),
        allowNull: false
    }
    
    }, {});
        
return Rol
    
}