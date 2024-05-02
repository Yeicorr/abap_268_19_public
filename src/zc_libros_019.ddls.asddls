@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_Libros_019 
as select from ztb_libros_019 as Libros
inner join ztb_catego_019 as Categorias
  on Libros.bi_categ = Categorias.bi_categ
left outer join zc_clnts_lib_019 as Ventas
  on Libros.id_libro = Ventas.IdLibro
  
association [0..*] to zc_clientes_019 as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
    key Libros.id_libro as IdLibro,
    key Libros.bi_categ as Categoria,
    Libros.titulo as Titulo,
    Libros.autor as Autor,
    Libros.editorial as Editorial,
    Libros.idioma as Idioma,
    Libros.paginas as Paginas,
    @Semantics.amount.currencyCode: 'Moneda'
    Libros.precio as Precio,
    Libros.moneda as Moneda,
    
//          case
//        when Ventas.ventas < 1 then 0
//        when Ventas.ventas >= 1 and Ventas.ventas < 2 then 1
//        when Ventas.ventas >= 2 and Ventas.ventas < 3 then 2
//        else 3
//      end                 as Ventas,
    '1' as Ventas,

    case Ventas.ventas
         when 0 then ''
         else ''
    end                 as Text,
      
    Libros.formato as Formato,
    Libros.url as Imagen,
    _Clientes
}
