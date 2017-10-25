trigger postToRelatedAcct on Opportunity (after insert) {
	LIst<FeedItem> posts = new LIst<FeedItem>();
	for(Opportunity o : trigger.new){
		FeedItem f = new FeedItem();
		f.type='LinkPost';
		f.Title = o.Name;
		f.LinkUrl = '/'+o.Id;
		f.ParentId = o.AccountId;
		if(o.Amount != null){
			String myAmt = String.valueOf(o.Amount);
			if(myAmt.substring(myAmt.length()-2, myAmt.length()-1) == '.'){
				myAmt += '0';
			}
			f.body = 'created the Opportunity \''+o.Name +'\' with an Opportunity Amount of $'+myAmt+' and is set to close on '+ o.CloseDate.month()+'/'+o.CloseDate.day()+'/'+o.CloseDate.year()+ '.';
		} else {
			f.body = 'created the Opportunity \''+o.Name +'\' and is set to close on '+ o.CloseDate.month()+'/'+o.CloseDate.day()+'/'+o.CloseDate.year()+ '.';
		}
		posts.add(f); 
	}
	
	insert posts; 
}