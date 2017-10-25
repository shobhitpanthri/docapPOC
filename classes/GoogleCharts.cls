public with sharing class GoogleCharts {
	public String UserId = UserInfo.getUserId();
    public String UserName = UserInfo.getName();
    User u = [Select id,contactId,Contact.AccountId from User where id = :UserId];
    public String acctId = u.Contact.AccountId;
	
	public List<Opportunity> olist {get;set;}
	public String opptyPie {get;set;}
	public String mapURL1{get;set;} 
	public String mapURL2{get;set;}
	public String mapURL3{get;set;}
	
	public List<Lead> lList {get;set;}
	public String leadURL {get;set;}
	
	public List<Case> cList {get;set;}
	public List<Case> ccList {get;set;}	
	public String caseURL1 {get;set;}
	public String caseURL2 {get;set;}
	
	public GoogleCharts(){
		olist = [Select Id, Amount, StageName, Owner.AccountId, IsClosed From Opportunity Where Owner.AccountId = :acctId];
		Decimal pipeline = 0;
		Decimal closedval = 0;
		Decimal lostval = 0;
		Integer closecount = 0;
		Integer Highcount = 0;
		Integer Criticalcount = 0;
		Integer Mediumcount = 0;
		Integer Lowcount = 0;
		Integer casecount = 0;
		Integer tnumber = 1;
		Integer leadcount =0;
		Decimal qualification=0;
		Decimal needsanalysis=0;
		Decimal iddecisionmakers=0;
		Decimal proposalpricequote=0;
		Decimal negotiationreview=0;
		Decimal oppTotal=0;
		
		
		llist = [Select Id, OwnerId, IsConverted From Lead Where OwnerId = :UserId AND IsConverted=false];
		cList = [Select Id, Priority, IsClosed, AccountId From Case Where AccountId =:acctId ];
		//ccList = [Select Id, IsClosed, Priority, AccountId From Case Where AccountId =:acctId AND IsClosed = true];
		
		for(Opportunity opp :olist){
			oppTotal += opp.Amount;
			
			if(opp.isClosed ==false){
				pipeline +=	opp.Amount;
			}
			if(opp.StageName =='Closed Lost'){
				lostval += opp.Amount;	
			}
			if(opp.isClosed == true){
				closedval += opp.Amount;
			}
			if(opp.StageName=='Qualification'){
				qualification += opp.Amount;
			}
			if(opp.StageName=='Needs Analysis'){
				needsanalysis += opp.Amount;
			}
			if(opp.StageName=='Id. Decision Makers'){
				iddecisionmakers += opp.Amount;
			}
			if(opp.StageName=='Proposal/Price Quote'){
				proposalpricequote +=opp.Amount;
			}
			if(opp.StageName=='Negotiation/Review'){
				negotiationreview += opp.Amount;
			}
		}
		
		Decimal q = (qualification/oppTotal)*100;
		Decimal needs = (needsanalysis/oppTotal)*100;
		Decimal id = (iddecisionmakers/oppTotal)*100;
		Decimal prop = (proposalpricequote/oppTotal)*100;
		Decimal neg = (negotiationreview/oppTotal)*100;
		Decimal won = (closedval/oppTotal)*100;
		Decimal lost = (lostval/oppTotal)*100;
		
		leadcount = llist.size();
		
		
		casecount = cList.size();
		
		for(Case cas :cList){
			if(cas.IsClosed){
				closecount += tnumber;
			}
			if(cas.Priority == 'Critical'){
				Criticalcount += tnumber;
			}
			if(cas.Priority == 'High'){
				Highcount += tnumber;
			}
			if(cas.Priority == 'Medium'){
				Mediumcount = tnumber;
			}
			if(cas.Priority == 'Low'){
				Lowcount = tnumber;
			}
		}
		//system.assert(false, Highcount);
		
		Decimal totalPipe = (pipeline*.0001)*2; 
		mapURL1 = 'http://chart.apis.google.com/chart?chxl=1:|%240|%24250k|%24500k&chf=bg,s,EAEAEA&chls=3|15&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=227x143&cht=gm&chtt=Partner+Pipeline&chco=000000,FF0000|FFFF1F|00AA00&chl=$'+pipeline+'&chd=t:'+totalPipe;
	
		Decimal totallost = (lostval*.0001)*2;
		mapURL2 = 'http://chart.apis.google.com/chart?chxl=1:|%240|%24250k|%24500k&chf=bg,s,EAEAEA&chls=3|15&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=267x143&cht=gm&chtt=Closed+Lost&chco=000000,00AA00|FFFF1F|FF0000&chl=$'+lostval+'&chd=t:'+totallost;
		
		Decimal totalclosed = (closedval*.0001)*2;
		mapURL3 = 'http://chart.apis.google.com/chart?chxl=1:|%240|%24250k|%24500k&chf=bg,s,EAEAEA&chls=3|15&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=227x143&cht=gm&chtt=Closed+Won&chco=000000,FF0000|FFFF1F|00AA00&chl=$'+closedval+'&chd=t:'+totalclosed;
		
		caseURL1 = 'http://chart.apis.google.com/chart?chxl=1:|0|10|20&chf=bg,s,EAEAEA&chls=3|15&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=227x143&cht=gm&chtt=Cases+Closed&chds=0,20&chco=000000,FF0000|FFFF1F|00AA00&chl='+closecount+'&chd=t:'+closecount; 
	
		caseURL2 = 'http://chart.apis.google.com/chart?chs=300x150&cht=p&chco=7777CC|76A4FB|3399CC|3366CC&chd=t:'+Criticalcount+','+highcount+','+mediumcount+','+lowcount+'&chl=Critical('+Criticalcount+')|High('+highcount+')|Medium('+mediumcount+')|Low('+lowcount+')&chdl=Critical|High|Medium|Low&chp=0.367&chtt=Cases+by+Priority&chf=bg,s,EAEAEA';
		
		opptyPie = 'http://chart.apis.google.com/chart?chs=350x225&cht=p&chd=t:'+q+','+needs+','+id+','+prop+','+neg+','+won+','+lost+'&chdl=Qualification|Needs+Analysis|Id+Decision+Makers|Proposal|Negotiation|Closed+Won|Closed+Lost&chtt=Opportunities+by+Stage';
		
		leadURL = 'http://chart.apis.google.com/chart?chxl=1:|0|10|20&chf=bg,s,EAEAEA&chls=3|15&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=227x143&cht=gm&chtt=My+Leads&chds=0,20&chco=000000,FF0000|FFFF1F|00AA00&chl='+leadcount+'&chd=t:'+leadcount; 	
	}

	//<img src="http://chart.apis.google.com/chart?chxl=1:|%240|%24250k|%24500k&chxs=0,676767,14.833|1,676767,14.5,0,l,676767&chxt=x,y&chs=400x196&cht=gm&chco=000000,FF0000|FFFF1F|00AA00&chd=t:70&chl=Groovy&chtt=Partner+Pipeline" width="400" height="196" alt="Partner Pipeline" />	
}