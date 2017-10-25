public class myInterviews {

        public List <Interview__c> interviewList= new List <Interview__c>();
        public String selectedTimeItem{get;set;}
        public String selectedPosition{get;set;}

        public List <Interview__c> getInterviewList(){
            return interviewList;
        }

        public void setTimeItem(String selectedTimeItem) {
            this.selectedTimeItem = selectedTimeItem;
        }
        
        public void setSelectedPosition(String selectedPosition) {
            this.selectedPosition = selectedPosition;
        }        

public PageReference filterResults(){

    if (selectedTimeItem=='Today'){
                 if (selectedPosition == 'Filter by Position...'){
                     interviewList = [SELECT Title__c, Name, Candidate__r.Name, Position__r.Name, Interview_Time__c from Interview__c WHERE Interview_Time__c=TODAY];
                 }
                 else{
                     interviewList = [SELECT Title__c, Name, Candidate__r.Name, Position__r.Name, Interview_Time__c from Interview__c WHERE Interview_Time__c=TODAY AND Position__r.Name=:selectedPosition];
                 }    }
    else if (selectedTimeItem=='Tomorrow'){
                 if (selectedPosition == 'Filter by Position...'){
                     interviewList = [SELECT Title__c, Name, Candidate__r.Name, Position__r.Name, Interview_Time__c from Interview__c WHERE Interview_Time__c=TOMORROW];
                 }
                 else{
                     interviewList = [SELECT Title__c, Name, Candidate__r.Name, Position__r.Name, Interview_Time__c from Interview__c WHERE Interview_Time__c=TOMORROW AND Position__r.Name=:selectedPosition];
                 }
    }
    else if (selectedTimeItem=='This Week'){
                 if (selectedPosition == 'Filter by Position...'){
                     interviewList = [SELECT Title__c, Name, Candidate__r.Name, Position__r.Name, Interview_Time__c from Interview__c WHERE Interview_Time__c=THIS_WEEK];
                 }
                 else{
                     interviewList = [SELECT Title__c, Name, Candidate__r.Name, Position__r.Name, Interview_Time__c from Interview__c WHERE Interview_Time__c=THIS_WEEK AND Position__r.Name=:selectedPosition];
                 }    } 
    else if (selectedTimeItem=='All Time'){
                 if (selectedPosition == 'Filter by Position...'){
                     interviewList = [SELECT Title__c, Name, Candidate__r.Name, Position__r.Name, Interview_Time__c from Interview__c WHERE Interview_Time__c>=TODAY];
                 }
                 else{
                     interviewList = [SELECT Title__c, Name, Candidate__r.Name, Position__r.Name, Interview_Time__c from Interview__c WHERE Interview_Time__c>=TODAY AND Position__r.Name=:selectedPosition];
                 }    }        
    else
    {
    interviewList = [SELECT Title__c, Name, Candidate__r.Name, Position__r.Name, Interview_Time__c from Interview__c WHERE Interview_Time__c=TODAY];
    }
    
    return null;
}


    public void go(){
         
    }
    
    public List<SelectOption> getItems() {
       List <SelectOption> options = new List <SelectOption>();
        
        List <Position__c> listOfPositions = new List <Position__c>();
        listOfPositions = [SELECT Name from Position__c];
        
            options.add(new SelectOption('Filter by Position...','Filter by Position...'));
        
        for(Position__c p: listOfPositions){
        
            options.add(new SelectOption(p.Name,p.Name));
        }
        
        return options;
    }
    
       public List<SelectOption> getTimeItems() {
       List <SelectOption> options = new List <SelectOption>();
        
       options.add(new SelectOption('Today','Today'));
       options.add(new SelectOption('Tomorrow','Tomorrow'));
       options.add(new SelectOption('This Week','This Week'));
       options.add(new SelectOption('All Time','All Time'));
       

        return options;
    }
   
    
}