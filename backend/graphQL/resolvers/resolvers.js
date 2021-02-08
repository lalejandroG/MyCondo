const resolvers = {

    Query: {
// Querys de Propietario
        async getPropietarios(root, args, { models }){
            return await models.propietario.findAll()
        },
        async getPropietarioId(root, args, { models }){
            return await models.propietario.findByPk(args.id)
        },

// Querys de Factura
        async getFacturas(root, args, { models }){
        return await models.factura.findAll()
        },
        async getFactura(root, args, { models }){
        return await models.factura.findByPk(args.id)
        },

// Querys de Lugares de Ocio
    async getLugaresOcio(root, args, { models }){
    return await models.lugarOcio.findAll()
    },
    async getLugarOcio(root, args, { models }){
    return await models.lugarOcio.findByPk(args.nombre)
    }

    },

    Mutation: {
// Mutation de Propietario
        async createPropietario(root, { cedula, nombre, apellido, rol }, { models }){
            return await models.propietario.create( {cedula, nombre, apellido, rol} )
        },
        

// Mutation de Factura
        async createFactura(root, { concepto, descripcion, monto }, { models }){
            return await models.factura.create( {concepto, descripcion, monto} )
        },
// Mutation de Lugares de Ocio
        async createLugarOcio(root, { nombre, estado }, { models }){
            return await models.lugarOcio.create( { nombre, estado } )
        }

    }

}

module.exports = resolvers