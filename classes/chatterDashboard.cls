// Jonathan Hersh - jhersh@salesforce.com - 2/24/2010
public with sharing class chatterDashboard {
    public userIcon[] notfollowingme    { get; set; }
    public userIcon[] notfollowingthem  { get; set; }
    
    public userIcon[] allfollowers		{ get; set; }
    public userIcon[] allfollowing		{ get; set; }
    
    public integer followercount		{ get; set; }
    public integer followingcount		{ get; set; }
    
    public Opportunity ulookup          { get; set; }
    
    public string ulookupname			{ get; set; }
    
    public chartData[] mychats			{ get; set; }
    public chartData[] allchats			{ get; set; }
    public chartData[] topaccts			{ get; set; }
    public chartData[] topoppties		{ get; set; }
    public chartData[] topcases			{ get; set; }
    
    public chatterDashboard() {
        doReset();
    }
    
    public pageReference doReset() {
        ulookup = new Opportunity();
       	ulookup.ownerid = UserInfo.getUserId();
        
        doSubmit();
        
        return null;
    }
    
    public pageReference doSubmit() {
    	ulookupname = [select firstname from User where id = :ulookup.ownerid].firstname;
    	
    	notfollowingme = new userIcon[] {};
        notfollowingthem = new userIcon[] {};
        allfollowers = new userIcon[] {};
        allfollowing = new userIcon[] {};

        mychats = new chartData[] {};
        allchats = new chartData[] {};
        topaccts = new chartData[] {};
        topoppties = new chartData[] {};
        topcases = new chartData[] {};
    	
        // Everyone we're following
        EntitySubscription[] followingES = [select id, parentid, subscriberid, parent.name
            from EntitySubscription
            where subscriberid = :ulookup.ownerid
            order by parent.name];
        
        Map<string,string> following = new Map<string,string> ();
        
        for( EntitySubscription es : followingES )
        	if( ('' + es.parentid).substring(0,3) == '005' ) // users only
            	following.put( es.parentid, es.parent.name );       
        
        // All users who are following us
        EntitySubscription[] followsusES = [select id, subscriberid, subscriber.name
            from EntitySubscription
            where parentid = :ulookup.ownerid
            order by subscriber.name];
            
        Map<string,string> followers = new Map<string,string> ();
        
        for( EntitySubscription es : followsusES )
            followers.put( es.subscriberid, es.subscriber.name );
            
        // Who are we following, but isn't following us back?
        for( string uID : following.keySet() )
        	if( !followers.containsKey( uID ) )
        		notfollowingme.add( new userIcon( uID, following.get( uiD ) ) );
        		
        // Who is following us, but we're not following them back?
        for( string uID : followers.keySet() )
        	if( !following.containsKey( uID ) )
        		notfollowingthem.add( new userIcon( uID, followers.get( uID ) ) );
        		
        // All followers
        followercount = followers.size();
        
        for( string uid : followers.keySet() )
        	allfollowers.add( new userIcon( uid, followers.get( uid ) ) );
        
        // All following
        followingcount = following.size();
        
        for( string uid : following.keySet() )
        	allfollowing.add( new userIcon( uid, following.get( uid ) ) );
        	
        // Chatter messages on the user's feed. past 7 days
        UserFeed[] ufs = [select id, FeedPost.body, createddate
			from UserFeed
			where parentid = :ulookup.ownerid
			and createddate >= :datetime.now().addDays(-7)
			order by createddate asc];
			
		Map<string,integer> updatesDay = new Map<string,integer> ();
		
		for( UserFeed uf : ufs )
			if( !updatesDay.containsKey( uf.createddate.format('MMM d') ) )
				updatesDay.put( uf.createddate.format('MMM d'), 1 );
			else
				updatesDay.put( uf.createddate.format('MMM d'), updatesDay.get( uf.createddate.format('MMM d') ) + 1 );	
		
		for( string s : updatesDay.keySet() )
			mychats.add( new chartData( s, ''+updatesDay.get( s ) ) );
		
		// All chatter messages
		AggregateResult[] arr = [select parent.name, count(id)
			from UserFeed
			group by parent.name
			order by count(id) desc limit 10];
			
		for( AggregateResult ar : arr )
			allchats.add( new chartData( string.valueof(ar.get( 'name' )), string.valueof(ar.get('expr0') )) );
			
		// Top accounts by status updates
		arr = [select parent.name, count(id)
			from AccountFeed
			where createddate > :Datetime.now().addDays(-7)
			group by parent.name
			order by count(id) desc limit 10];	
			
		for( AggregateResult ar : arr )
			topaccts.add( new chartData( string.valueof(ar.get( 'name' )), string.valueof(ar.get('expr0') )) );
			
		// Top oppties by status updates
		arr = [select parent.name, count(id)
			from OpportunityFeed
			where createddate > :Datetime.now().addDays(-7)
			group by parent.name
			order by count(id) desc limit 10];	
			
		for( AggregateResult ar : arr )
			topoppties.add( new chartData( string.valueof(ar.get( 'name' )), string.valueof(ar.get('expr0') )) );
			
		// Top cases by status updates. why is there no parent.name field on CaseFeed?
		arr = [select parentid, count(id)
			from CaseFeed
			where createddate > :Datetime.now().addDays(-7)
			group by parentid
			order by count(id) desc limit 10];	
			
		ID[] caseIDs = new ID[] {};
			
		for( AggregateResult ar : arr )
			caseIDs.add( string.valueof(ar.get('parentid')));
			
		Map<Id,Case> casemap = new Map<Id,Case> ([select id,casenumber from Case where id IN :caseIDs]);
		
		for( AggregateResult ar : arr )
			topcases.add( new chartData( casemap.get(string.valueof(ar.get( 'parentid' ))).casenumber, string.valueof(ar.get('expr0') )) );
        
        return null;
    }
    
    public class userIcon {
        public string uid   { get; set; }
        public string uname { get; set; }
        
        public userIcon( string uid2, string uname2 ) {
            uid = uid2;
            uname = uname2;
        }       
    }
    
    public class chartData {
    	public string key	{ get; set; }
    	public string val	{ get; set; }
    	
    	public chartData( string k, string v ) {
    		key = k;
    		val = v;
    	}	
    }
    
    public static testmethod void runTest() {
    	chatterDashboard cd = new chatterDashboard();
    	cd.doReset();
    }
}