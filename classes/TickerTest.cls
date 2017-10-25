@isTest
private class TickerTest {
	
	static testMethod void TickerTest() {
		TickerSetupController setupController = new TickerSetupController();
		TickerDisplayController displayController = new TickerDisplayController();
		
		setupController.settings = new List<Ticker_Settings__c>();
		setupController.save();
	}
}