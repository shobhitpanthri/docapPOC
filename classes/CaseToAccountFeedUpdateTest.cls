@isTest
private class CaseToAccountFeedUpdateTest {

    static testMethod void Test() {
        Account a = new Account(name = 'Test');
        insert a;
        Case c = new Case(accountId = a.id);
        insert c;
        c.Status = 'Closed';
        update c;
    }
}