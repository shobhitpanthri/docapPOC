trigger CaseToAccountFeedUpdate on Case (after update) {
        
    List<FeedPost> posts = new List<FeedPost>();
    
    for(Case newCase : Trigger.new) {
        Case oldCase = Trigger.oldMap.get(newCase.id);
        System.debug('New: '+newCase.Status+'   Old: '+oldCase.Status);
        
        if(newCase.Status != oldCase.Status) {
            
            List<AccountFeed> acctFeedPosts = [SELECT Id, Type, FeedPost.Body 
                                                FROM AccountFeed 
                                                WHERE ParentId = :newCase.AccountId 
                                                ORDER BY CreatedDate DESC];
           
           String bodyText = 'Case '+newCase.CaseNumber+
                            ' Status was changed from '+oldCase.Status+' to '+newCase.Status+'.';            
            
            if(acctFeedPosts.size() == 0 || acctFeedPosts[0].FeedPost.Body != bodyText) {
                        
                //System.debug('AccountFeed Posts: '+acctFeedPosts[0]);
                
                FeedPost acctPost = new FeedPost();
                acctPost.Type = 'LinkPost';
                acctPost.Title = 'Case '+newCase.CaseNumber+': '+newCase.Subject;
                acctPost.Body = bodyText;
                String id = String.valueOf(newCase.id).substring(0,15);
                acctPost.LinkURL = 'https://na1.salesforce.com/'+id;
                acctPost.ParentID = newCase.accountid;
                posts.add(acctPost);
            }
        }
    }
    insert posts;
    }