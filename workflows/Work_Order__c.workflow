<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>ContactAccount</fullName>
        <field>Contact_Account__c</field>
        <formula>Case__r.Contact.Account.Name</formula>
        <name>Contact Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ContactEmail</fullName>
        <field>Contact_Email__c</field>
        <formula>Case__r.Contact.Email</formula>
        <name>Contact Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ContactName</fullName>
        <field>Contact_Name__c</field>
        <formula>Case__r.Contact.FirstName  &amp;  &quot; &quot;  &amp; Case__r.Contact.LastName</formula>
        <name>Contact Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ContactPhone</fullName>
        <field>Contact_Phone__c</field>
        <formula>Case__r.Contact.Phone</formula>
        <name>Contact Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EmptyContactAccount</fullName>
        <field>Contact_Account__c</field>
        <name>Empty Contact Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EmptyContactEmail</fullName>
        <field>Contact_Email__c</field>
        <name>Empty Contact Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EmptyContactName</fullName>
        <field>Contact_Name__c</field>
        <name>Empty Contact Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EmptyContactPhone</fullName>
        <field>Contact_Phone__c</field>
        <name>Empty Contact Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requires_Approval</fullName>
        <field>Requires_Manager_Approval__c</field>
        <literalValue>1</literalValue>
        <name>Requires Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Expense Approval needed</fullName>
        <actions>
            <name>Requires_Approval</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Work_Order__c.Total_Work_Order_Costs__c</field>
            <operation>greaterThan</operation>
            <value>1000</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>WORK ORDER CONTACT MANUAL</fullName>
        <actions>
            <name>EmptyContactAccount</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EmptyContactEmail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EmptyContactName</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EmptyContactPhone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Work_Order__c.Use_Case_Contact_Information__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Work Order Contact Auto</fullName>
        <actions>
            <name>ContactAccount</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ContactEmail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ContactName</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ContactPhone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Work_Order__c.Use_Case_Contact_Information__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
