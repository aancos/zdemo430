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
@Analytics.query: true
define view entity Z00_C_AN_EMPLEADOS as select from Z00_R_Employee
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

    @AnalyticsDetails.query.axis: #ROWS
    @AnalyticsDetails.query.display: #KEY_TEXT

    DepartmentId,

    @AnalyticsDetails.query.axis: #FREE
    @AnalyticsDetails.query.display: #TEXT
    
    _Department.Description as DepartmentDescription,

    @AnalyticsDetails.query.axis: #COLUMNS
    @EndUserText.label: 'Monthly Salary'
    @Semantics.amount.currencyCode: 'CurrencyCode'
    cast( AnnualSalary as abap.fltp ) / 12.0 as MonthlySalary,

    @AnalyticsDetails.query.axis: #COLUMNS
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,

    @AnalyticsDetails.query.axis: #COLUMNS

    division( dats_days_between( 
                        EntryDate, 
                        $session.system_date 
                        ), 
                        365, 1 ) as CompanyAffiliation,

    CurrencyCode,
    cast( 'USD' as /dmo/currency_code ) as CurrencyCodeUSD,

    _Department._Assistant.LastName as AssistantName1,
    concat_with_space( _Department._Assistant.FirstName, 
                    _Department._Assistant.LastName, 
                    1 ) as AssistantName,

    /* Associations */
    _Department
}
