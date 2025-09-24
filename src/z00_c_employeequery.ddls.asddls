@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Empl Query'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z00_C_EMPLOYEEQUERY as select from Z00_R_Employee
{

    key EmployeeId,

    FirstName,
   
    LastName,
    @EndUserText.label: 'Employee xxx Role'
    
    case EmployeeId
        when _Department.HeadId then 'H'
        when _Department.AssistantId then 'A'
        else ' '
    end as EmployeeRole,

    EntryDate,

    division( dats_days_between( 
                        EntryDate, 
                        $session.system_date 
                        ), 
                        365, 1 ) as CompanyAffiliation,
    
    
    @EndUserText.label: 'Monthly Salary'
    @Semantics.amount.currencyCode: 'CurrencyCode'
    cast( AnnualSalary as abap.fltp ) / 12.0 as MonthlySalary,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
    CurrencyCode,
 cast( 'USD' as /dmo/currency_code ) as CurrencyCodeUSD,
 
// @EndUserText.label: 'Annual Salary'
// @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
// currency_conversion( amount => AnnualSalary,
//                      source_currency => CurrencyCode ,
//                      target_currency => $projection.CurrencyCodeUSD,
//                      exchange_rate_date => $session.system_date 
//                      ) as AnnualSalaryConverted,
 
   
    DepartmentId,
    _Department.Description as DepartmentDescription,
    _Department._Assistant.LastName as AssistantName1,
    
    concat_with_space( _Department._Assistant.FirstName, 
                    _Department._Assistant.LastName, 
                    1 ) as AssistantName,
    

    /* Associations */
    _Department
}
