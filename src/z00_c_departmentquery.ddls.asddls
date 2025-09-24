@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Query Departamento'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z00_C_DEPARTMENTQUERY as select  from Z00_C_EMPLOYEEQUERY
{
    DepartmentId,
    _Department.Description,
    avg( CompanyAffiliation as abap.dec(11,1) ) as AverageAffiliation,
    @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
    sum( AnnualSalary ) as TotalSalary,
   
    count(*) as Empleados,
    CurrencyCodeUSD,
    _Department
}
group by
    DepartmentId,
    _Department.Description,
    CurrencyCodeUSD
