const { gql } = require('apollo-server-express')

const typeDefs = gql`

type Propietario{
    id: Int!
    cedula: Int!
    nombre: String!
    apellido: String!
    rol: String!
}

type Factura{
    id: Int!
    concepto: String!
    descripcion: String!
    monto: Int!
}

type LugarOcio{
    nombre: String!
    estado: String!
}



type Query{
    getPropietarios: [Propietario]
    getPropietarioId(id: Int!): Propietario

    getFacturas: [Factura]
    getFactura(id: Int!): Factura

    getLugaresOcio: [LugarOcio]
    getLugarOcio(nombre: String!): LugarOcio


}

type Mutation{
    createPropietario(cedula: Int!, nombre: String!, apellido: String!, rol: String!): Propietario!

    createFactura(concepto: String!, descripcion: String!, monto: Int!): Factura!

    createLugarOcio(nombre: String!, estado: String!): LugarOcio!
}

`


module.exports = typeDefs