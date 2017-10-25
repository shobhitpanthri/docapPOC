// Jonathan Hersh - jhersh@salesforce.com 
// November 20, 2008 

public class leadCallDownController { 
public Lead[] ls { get; set; } 

public leadCallDownController() { 
ls = [select id, name, phone, company from Lead where phone <> null 
and ownerid = :Userinfo.getUserId() and isconverted = false order by company LIMIT 999]; 

} 
}