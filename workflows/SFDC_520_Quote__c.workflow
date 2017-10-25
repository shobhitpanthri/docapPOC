<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>NewOrderforInvoicing</fullName>
        <description>New Order for Invoicing</description>
        <protected>false</protected>
        <recipients>
            <recipient>spanthri@demo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SalesTemplates/NEWORDERFORINVOICING</template>
    </alerts>
    <rules>
        <fullName>New Order ready for Invoicing</fullName>
        <actions>
            <name>NewOrderforInvoicing</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>SFDC_520_Quote__c.Approval_Stage__c</field>
            <operation>equals</operation>
            <value>Internally Approved</value>
        </criteriaItems>
        <description>Workflow to auto send an email to the user to inform them that an Invoice needs to be initiated.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
