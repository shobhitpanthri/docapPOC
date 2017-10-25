public with sharing class portalresults {
    public String UserId = UserInfo.getUserId();
    public String UserName = UserInfo.getName();
    User u = [Select id,contactId,Contact.AccountId from User where id = :UserId];
    public String keyword {get;set;}
       public List<Question> qlist {get;set;}
       public List<Idea> ideaList {get;set;}
       public List<Case> caseList {get;set;}
       public List<ContentVersion> contentList {get;set;}
       
       public boolean showArticles {get;set;}

       public Integer returnedRows1 {get;set;}
       public Integer returnedRows2 {get;set;}
       public Integer returnedRows3 {get;set;}
       public Integer returnedRows4 {get;set;}
       
       public Question[] foundQuestions {get;set;}
    
    public portalresults(){
        keyword= ApexPages.currentPage().getParameters().get('search');
        
        Question question = new Question ();

        // Specify a title for the new question  
    
        question.title = keyword;
        

        // Specify the communityID (INTERNAL_COMMUNITY) in which to find similar questions.   
    
        Community community = [ SELECT Id FROM Community WHERE Name like '%*%' limit 1];
        
        question.communityId = community.id;
                
        ID[] results = Answers.findSimilar(question);

        qlist = [Select Title From Question Where ID IN:results];
        
        String searchstring = '%'+keyword+'%';
        
        ideaList = [Select Title, VoteTotal, Category,VoteScore, Status__c, LastModifiedDate From Idea Where Title LIKE :searchstring order by LastModifiedDate desc limit 3];
        caseList = [select id,CaseNumber,Subject,Status,LastModifiedDate, AccountId
                         from Case 
                         where Subject LIKE :searchstring AND AccountId =:u.Contact.AccountId
                         order by LastModifiedDate desc limit 3];
        contentList = [Select Id, Title from ContentVersion where Title like: '%'+keyword+'%' and isLatest=true];
        
        showArticles = true;
        
        
        
        this.returnedRows1=qlist.size();
        this.returnedRows2=ideaList.size();
        this.returnedRows3=caseList.size();
        this.returnedRows4=contentList.size();
    }
    public boolean getshowAnswers1(){
        if(this.returnedRows1>0){
            return true;
        }else{
            return false;   
        }
   }
   
   public boolean getnoAnswers1(){
        if(this.returnedRows1<1){
            return true;
                
        }else{
            return false;   
        }
   }
   public boolean getshowAnswers2(){
        if(this.returnedRows2>0){
            return true;
        }else{
            return false;   
        }
   }
   
   public boolean getnoAnswers2(){
        if(this.returnedRows2<1){
            return true;
                
        }else{
            return false;   
        }
   }
   public boolean getshowAnswers3(){
        if(this.returnedRows3>0){
            return true;
        }else{
            return false;   
        }
   }
   
   public boolean getnoAnswers3(){
        if(this.returnedRows3<1){
            return true;
                
        }else{
            return false;   
        }
   }
   public boolean getshowAnswers4(){
        if(this.returnedRows4>0){
            return true;
        }else{
            return false;   
        }
   }
   
   public boolean getnoAnswers4(){
        if(this.returnedRows4<1){
            return true;
                
        }else{
            return false;   
        }
   }
}