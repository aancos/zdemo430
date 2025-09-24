@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS C Empleados'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z00_C_Employee as select from Z00_R_Employee
{
    key EmployeeId,
    @EndUserText.label: 'Nombre'
    FirstName,
    LastName,
    BirthDate,
    EntryDate,
    DepartmentId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
    CurrencyCode,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
}
