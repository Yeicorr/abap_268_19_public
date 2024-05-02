@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Metadata.allowExtensions: true
define view entity zc_clientes_019 
as select from ztb_clientes_019 as Clientes
inner join ztb_clnts_lib_19 as RelCliLib
on Clientes.id_cliente = RelCliLib.id_cliente
{
    key RelCliLib.id_libro as IdLibro,
    key Clientes.id_cliente as IdCliente,
    key Clientes.tipo_acceso as TipoAcceso,
    Clientes.nombre as Nombre,
    Clientes.apellidos as Apellidos,
    Clientes.email as Email,
    Clientes.url as Url,
    concat_with_space(Clientes.nombre, Clientes.apellidos, 2) as NombreCompleto
}
