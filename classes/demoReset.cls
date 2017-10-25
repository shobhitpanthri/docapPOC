public class demoReset {
    public List <Interview__c> interviewList = new List <Interview__c>();
    public Boolean demoReset = false;
    
    public Boolean getDemoReset(){
        return demoReset;
    }
    
    public void go(){
            interviewList = [SELECT id FROM Interview__c];
            if (interviewList.size() > 0){
                  delete interviewList;

            }
            
            Datetime currentDateTime = System.now();
            DateTime firstTime = currentDateTime.addHours(1);  
            DateTime secondTime = currentDateTime.addHours(2);
            DateTime thirdTime = currentDateTime.addHours(3);    
                    
            DateTime fourthTime = currentDateTime.addHours(1);            
            fourthTime = fourthTime.addDays(1);            

            DateTime fifthTime = currentDateTime.addHours(2);            
            fifthTime = fifthTime.addDays(1);  
            
            DateTime sixthTime = currentDateTime.addHours(2);            
            sixthTime = sixthTime.addDays(1);                                    
                
            Interview__c firstInterview = new Interview__c(Candidate__c = 'a1jE00000002BVc', Position__c = 'a1mE0000000jT7D', Interview_Time__c = firstTime, Scheduled_Window__c = 45);
            insert firstInterview;

            Interview__c secondInterview = new Interview__c(Candidate__c = 'a1jE00000002BVX', Position__c = 'a1mE0000000jT7E', Interview_Time__c = secondTime, Scheduled_Window__c = 45);
            insert secondInterview;  
            
            Interview__c thirdInterview = new Interview__c(Candidate__c = 'a1jE000000021rY', Position__c = 'a1mE0000000sa5l', Interview_Time__c = thirdTime, Scheduled_Window__c = 45);
            insert thirdInterview; 
            
            Interview__c fourthInterview = new Interview__c(Candidate__c = 'a1jE000000021rT', Position__c = 'a1mE0000000jT7D', Interview_Time__c = fourthTime, Scheduled_Window__c = 45);
            insert fourthInterview;  
            
            Interview__c fifthInterview = new Interview__c(Candidate__c = 'a1jE00000001tSK', Position__c = 'a1mE0000000jT7E', Interview_Time__c = fifthTime, Scheduled_Window__c = 45);
            insert fifthInterview;     
            
            Interview__c sixthInterview = new Interview__c(Candidate__c = 'a1jE00000001tSK', Position__c = 'a1mE0000000jT7D', Interview_Time__c = sixthTime, Scheduled_Window__c = 45);
            insert sixthInterview;                                            

            Feedback__c firstFeedback = new Feedback__c(Interview__c = firstInterview.id, Rating__c = 'Good Fit', Rating_Out_Of_10__c = 5);
            Feedback__c secondFeedback = new Feedback__c(Interview__c = fourthInterview.id, Rating__c = 'Bad Fit', Rating_Out_Of_10__c = 3);
            Feedback__c thirdFeedback = new Feedback__c(Interview__c = sixthInterview.id, Rating__c = 'Good Fit', Rating_Out_Of_10__c = 6);
            
            insert firstFeedback;
            insert secondFeedback;
            insert thirdFeedback;
            
            demoReset = true;
    }
    
    
}