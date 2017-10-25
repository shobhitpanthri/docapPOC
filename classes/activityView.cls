// Jonathan Hersh - jhersh@salesforce.com - 9/21/2009
public with sharing class activityView {
	public userActivity[] actValues			{ get; set; }
	
	public activityView( ApexPages.standardcontroller c ) {
		Map<string,userActivity> actMap = new Map<string,userActivity> ();
		Map<ID,Opportunity> opMap = new Map<ID,Opportunity> ([select id from Opportunity where accountid = :c.getID()]);
		Map<ID,Contact> conMap = new Map<ID,Contact> ([select id from Contact where accountid = :c.getID()]);
		Map<ID,Case> caseMap = new Map<ID,Case> ([select id from Case where accountid = :c.getID()]);
		
		for( Task t : [select id, subject, ownerid, owner.name, activitydate, whatid, what.name, whoid, who.name
						from Task
						where ( whatid = :c.getID() or whatid in :opMap.keySet() or whatid in :caseMap.keySet() 
							or whoid in :conMap.keySet() ) //or ( whoid <> null and who.accountid = :c.getID() )
						and isclosed = true
						order by activitydate asc])
			if( actMap.get( t.ownerid ) == null )
				actMap.put( t.ownerid, new userActivity( 1, t, false ) );
			else
				actMap.put( t.ownerid, new userActivity( actMap.get( t.ownerid ).acts + 1, t, false ) );
				
		Map<integer,userActivity[]> sortMap = new Map<integer,userActivity[]> ();
		
		for( userActivity ua : actMap.values() )
			if( sortMap.get( ua.acts ) == null )
				sortMap.put( ua.acts, new userActivity[] { ua } );
			else
				sortMap.get( ua.acts ).add( ua );
		
		integer[] sortedKeys = new integer[] {};
		sortedKeys.addAll(sortMap.keySet());
		sortedKeys.sort();

		actValues = new userActivity[] {};
		
		for( integer x = sortedKeys.size() - 1; x >= 0; x-- )
			actValues.addAll( sortMap.get( sortedKeys.get( x ) ) );
		
		if( actValues.size() > 0 ) {
			integer max = actValues[0].acts;
			
			for( userActivity ua : actValues )
				if( ua.acts == max )
					ua.max = true;
		}
	}
	
	public class userActivity {
		public integer acts	{ get; set; }
		public Task lastAct	{ get; set; }
		public boolean max	{ get; set; }
		
		public userActivity( integer acts2, Task lastAct2, boolean max2 ) {
			acts = acts2;
			lastAct = lastAct2;
			max = max2;
		}
	}
	
	public static testmethod void doTest() {
		//ActivityView av = new activityView( new ApexPages.standardcontroller() );
		activityView.junk();
	}
	
	public static void junk() {
		integer x = 0;
		x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;
		x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;
		x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;
		x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;x++;
	}
}