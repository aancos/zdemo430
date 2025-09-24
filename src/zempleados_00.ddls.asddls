@AbapCatalog.sqlViewName: 'ZV_EMP00'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Empleados'
@Metadata.ignorePropagatedAnnotations: true
define view ZEMPLEADOS_00 as select from z00employ
{
    key employee_id as EmployeeId,
    first_name as FirstName,
    last_name as LastName,
    birth_date as BirthDate,
    entry_date as EntryDate,
    department_id as DepartmentId,
    annual_salary as AnnualSalary,
    currency_code as CurrencyCode,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt
}
