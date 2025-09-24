@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'Z00EMPLOY'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_00EMPLOY
  as select from Z00EMPLOY
{
  key employee_id as EmployeeID,
  first_name as FirstName,
  last_name as LastName,
  birth_date as BirthDate,
  entry_date as EntryDate,
  department_id as DepartmentID,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  annual_salary as AnnualSalary,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency_code as CurrencyCode,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
