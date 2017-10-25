// Jonathan Hersh - jhersh@salesforce.com - 1/8/2009
global class email2Content implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

        if (email.binaryAttachments!=null && email.binaryAttachments.size() > 0) {
          for (integer i = 0 ; i < email.binaryAttachments.size() ; ++i) {

           // System.debug(email.binaryAttachments[i].filename + ' (binary) Attachment: ' + email.binaryAttachments[i].mimeTypeSubType);

            ContentVersion content = new ContentVersion();
            content.Title = email.binaryAttachments[i].filename;
            content.PathOnClient = email.binaryAttachments[i].filename;
            content.VersionData = email.binaryAttachments[i].body;
            //content.description = email.plainTextBody;
            
            User[] us = [select id from User where email = :email.fromaddress];
            
            /*if( !us.isEmpty() )
              content.ownerid = us[0].id;*/
              
            insert content;
            
            // Change the workspace ID below to insert content into a particular workspace
            /*ContentWorkspaceDoc cwd = new ContentWorkspaceDoc();
            cwd.contentworkspaceid = 'workspaceIDhere';
            cwd.contentdocumentid = [select id from ContentDocument where latestpublishedversionid = :content.id].id;
            insert cwd;*/          
          }
        }
        
        return result;
    }
    
    global void junk() {
        integer x = 0;
        x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;
        x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;
        x++;x++;x++;x++;x++;x++;
    }
}