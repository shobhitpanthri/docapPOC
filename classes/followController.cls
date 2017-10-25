// Jonathan Hersh - jhersh@salesforce.com - 2/23/2010

public class followController {
	public userFollowers[] ufs				{ get; set; }
	public Map<string,Set<string>> followers	{ get; set; }
	public Map<string,Set<string>> following	{ get; set; }
	
	public userFollowers[] ufFilter			{ get; set; }
	
	public string searchstr					{ get; set; }
	
	public boolean showNoFollowers			{ get; set; }
	public boolean showNoFollowing			{ get; set; }
	
	public boolean showUsers				{ get; set; }
	public boolean showCases				{ get; set; }
	public boolean showOppties				{ get; set; }
	public boolean showAccts				{ get; set; }
	
	public string followID					{ get; set; }
	
	public string sortField 				{ get; set; }
    public string previousSortField 		{ get; set; }
    public string order						{ get; set; }
	
	public followController() {
		followers = new Map<string, Set<string>> ();
		following = new Map<string, Set<string>> ();
		
		string[] cases = new string[] {};
		string[] oppties = new string[] {};
		string[] accts = new string[] {};
		
		ufs = new userFollowers[] {};
		ufFilter = new userFollowers[] {};
		
		doReset();
		
		Map<ID,User> us = new Map<ID,User> ([select id, name from User where contactid = null and isactive = true and lastname <> 'Site Guest User' order by lastname]);
		
		EntitySubscription[] ess = [select parentid, subscriberid 
			from EntitySubscription
			where parentid IN :us.keySet()
			or subscriberid IN :us.keySet()];
		
		for( EntitySubscription es : ess ) {
			if( followers.containsKey( es.parentid ) )
				followers.get( es.parentid ).add( es.subscriberid );
			else
				followers.put( es.parentid, new Set<string> { es.subscriberid } );
				
			if( following.containsKey( es.subscriberid ) )
				following.get( es.subscriberid ).add( es.parentid );
			else
				following.put( es.subscriberid, new Set<string> { es.parentid } );				
		}
		
		// Load in other objects that have follower/followings
		for( string oid : followers.keySet() ) {
			if( oid.substring( 0, 3 ) == '001' )
				accts.add( oid );
			else if( oid.substring( 0, 3 ) == '500' )
				cases.add( oid );
			else if( oid.substring( 0, 3 ) == '006' )
				oppties.add( oid );			
		}
		
		AggregateResult[] ars = [select parentid, MAX( createddate )
			from UserFeed
			where parentid IN :us.keySet()
			group by parentid];		
		
		Map<string,datetime> userUpdates = new Map<string,datetime> ();
		
		for( AggregateResult ar : ars )
			userUpdates.put( string.valueof(ar.get('parentid')), datetime.valueof(ar.get('expr0')) );
		
		// Assemble the data to be presented
		
		for( User u : us.values() )
			ufs.add( new userFollowers( u.id, u.name, 'User',
				( followers.containsKey( u.id ) ? followers.get( u.id ).size() : 0 ), 
				( following.containsKey( u.id ) ? following.get( u.id ).size() : 0 ),
				( following.containsKey( u.id ) ? following.get( u.id ).contains( UserInfo.getUserId() ) : false ), 
				( userUpdates.containsKey( u.id ) ? userUpdates.get( u.id ) : null ),
				( followers.containsKey( UserInfo.getUserId() ) ? followers.get( UserInfo.getUserId() ).contains( u.id ) : false )
			) );
				
		for( Case c : [select id, casenumber from Case where id IN :cases] )
			ufs.add( new userFollowers( c.id, c.casenumber, 'Case',
				( followers.containsKey( c.id ) ? followers.get( c.id ).size() : 0 ), 0,
				( following.containsKey( c.id ) ? following.get( c.id ).contains( UserInfo.getUserId() ) : false ), null, false
			) );
				
		for( Account a : [select id, name from Account where id IN :accts] )
			ufs.add( new userFollowers( a.id, a.name, 'Account',
				( followers.containsKey( a.id ) ? followers.get( a.id ).size() : 0 ), 0,
				( following.containsKey( a.id ) ? following.get( a.id ).contains( UserInfo.getUserId() ) : false ), null, false
			) );
				
		for( Opportunity o : [select id, name from Opportunity where id IN :oppties] )
			ufs.add( new userFollowers( o.id, o.name, 'Opportunity',
				( followers.containsKey( o.id ) ? followers.get( o.id ).size() : 0 ), 0,
				( following.containsKey( o.id ) ? following.get( o.id ).contains( UserInfo.getUserId() ) : false ), null, false
			) );
		
		doFilter();
	}
	
	public pageReference doReset() {
		showNoFollowers = true;
		showNoFollowing = true;
		
		showUsers = true;
		showCases = true;
		showOppties = true;
		showAccts = true;
		
		searchstr = '';
		followID = '';
		
		sortField = 'name';
		
		doFilter();

		return null;		
	}
	
	public void doSort() {
		order = 'desc';
		        
        /*This checks to see if the same header was click two times in a row, if so 
        it switches the order.*/
        if(previousSortField == sortField){
            order = 'asc';
            previousSortField = null;
        } else {
            previousSortField = sortField;
        }
       
        superSort.sortList(ufFilter,sortField,order);
    }

	public pageReference doFilter() {
		ufFilter = new userFollowers[] {};
		
		for( userFollowers uf : ufs ) {
			if( uf.obtype == 'User' && !showUsers )
				continue;
				
			if( uf.obtype == 'Case' && !showCases )
				continue;
				
			if( uf.obtype == 'Opportunity' && !showOppties )
				continue;
				
			if( uf.obtype == 'Account' && !showAccts )
				continue;			
			
			if( searchstr != '' && !uf.name.tolowercase().contains( searchstr.tolowercase() ) )
				continue;
			
			if( uf.followers > 0 && uf.following > 0 )
				ufFilter.add( uf );
			else if( uf.followers == 0 && !showNoFollowers )
				continue;
			else if( uf.following == 0 && !showNoFollowing )
				continue;	
			else
				ufFilter.add( uf );
		}
		
		doSort();
				
		return null;
	}
	
	public class userFollowers {
		public string oid		 	{ get; set; }
		public string name			{ get; set; }
		public string obtype		{ get; set; }
		
		public integer followers	{ get; set; }
		public integer following	{ get; set; }
		
		public string lastupdate	{ get; set; }
		public datetime lastupdatedt{ get; set; }
		
		public boolean isFollowing	{ get; set; }
		
		public boolean followsme	{ get; set; }
		
		public userFollowers( string oid2, string name2, string obtype2, integer f1, integer f2, boolean if2, datetime la2, boolean followsme2 ) {
			oid = oid2;
			name = name2;
			obtype = obtype2;
			
			followers = f1;
			following = f2;
			
			isFollowing = if2;
			
			lastupdatedt = la2;
			lastupdate = ( la2 != null ? la2.format('M/d/yyyy h:mm a') : '' );
			
			followsme = followsme2;
		}
		
		public string get( string var ) { 
			if( var == 'name' ) return this.name;
			if( var == 'followers' ) return '' + this.followers;
			if( var == 'following' ) return '' + this.following;
			if( var == 'isFollowing' ) return ( this.isFollowing ? '1' : '0' );
			if( var == 'lastupdate' ) return ( this.lastupdatedt != null ? '' + this.lastupdatedt.getTime() : '' );
			if( var == 'followingme' ) return ( this.followsme ? '1' : '0' );
			
			return this.name;			
		}
	}
}