public class ActivityTemplateController {
    public Opportunity oppty { get; set; }
    public List<Task> tList { get; set; }
    public List<Activity_Template__c> templateList {get; set;}
    public String templateName {get; set;}
    
    public final integer pagesize = 5;
    
    public ActivityTemplateController() {
        oppty = [select id, name from Opportunity where id =
            :ApexPages.currentpage().getParameters().get('id')];    
        
        tList = new List<Task>();
        
        for( integer x = 0; x < pagesize; x++ ) {
            tList.add( new Task( whatid = oppty.id, status = 'Not Started' ) );
        }
    }
    
    public PageReference updateTasks() {
        tList = new List<Task>();
        
        List<Activity_Template_Line__c>lineList = [select of_Days__c, Subject__c, Id, CreatedDate, Assigned_To__c, Activity_Template__c, Description__c
                                                   from Activity_Template_Line__c
                                                   where Activity_Template__c = :templateName];
                                                   
        for (Activity_Template_Line__c cur : lineList) {
            tList.add(new Task(whatId = oppty.id, status = 'Not Started', Description = cur.Description__c, Subject = cur.Subject__c, OwnerId = cur.Assigned_To__c, ActivityDate = Date.Today() + cur.of_Days__c.intValue()));
        }   
        //System.assert(false, 'about to return. templateName = ' + templateName);                                                      
        return null;
    }
    
    public List<SelectOption> getTemplates() {
        templateList = [select id, name from Activity_Template__c];
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', 'None'));
        for (Activity_Template__c cur : templateList) {
            options.add(new SelectOption(cur.id,cur.name));
        }
        return options;
    }
    
    public pageReference save() {
        List<Task> to_add = new List<Task>();
        
        for( Task tmp : tList ) {
            if( tmp.ownerid != null ) {
                to_add.add( tmp ); 
            }
        }
        try {
            insert to_add;
        } catch( Exception e ) {}
        
        pageReference pr = new pageReference('/'+ oppty.id);
        pr.setredirect(true);
        return pr;  
    }
    
    public pageReference cancel() {
        pageReference pr = new pageReference('/'+ oppty.id);
        pr.setredirect(true);
        return pr;  
    }
    
    
    public static testMethod void testAdd() {
            pageReference pref = Page.ActivityCreator;
            
            Opportunity oppty = new Opportunity(Amount = 300, StageName = 'Prospecting', CloseDate = Date.Today(), Name = 'Test Oppty');
            insert oppty;
            
            Activity_Template__c aTemplate = new Activity_Template__c(Name = 'Test Template');
            insert aTemplate;
            Activity_Template_Line__c aLine = new Activity_Template_Line__c(Subject__c = 'Test Sub', of_Days__c = 5, Activity_Template__c = aTemplate.id);
            insert aLine; 
            
            pref.getParameters().put('id',oppty.id );
            
            test.setCurrentPage( pref );
            
            ActivityTemplateController con = new ActivityTemplateController();
            
            con.templateName = aTemplate.id;
            con.getTemplates();
            con.updateTasks();
            con.save();
            con.cancel();
    }
    
}