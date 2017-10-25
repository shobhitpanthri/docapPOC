// trigger automatically syncs the user to the contact record.
// from Chet Chauhan
trigger update_contact on User bulk (after update) { 
        Contact c; 
        for (User u : Trigger.new) { 
                String contactId = u.ContactId; 
                if (contactId!=null && contactId!='') { 
                        c = [select Id,Email from Contact where Id=:contactId]; 
                        c.Email = u.Email; 
                        c.FirstName=u.FirstName; 
                        c.LastName=u.LastName; 
                        c.Title=u.Title; 
                        c.Phone=u.Phone; 
                        c.Fax=u.Fax; 
                        c.MobilePhone=u.MobilePhone; 
                        c.MailingStreet=u.Street; 
                        c.MailingCity=u.City; 
                        c.MailingState=u.State; 
                        c.MailingPostalCode=u.PostalCode; 
                        c.MailingCountry=u.Country; 
                        update c; 
                } 
        }
}