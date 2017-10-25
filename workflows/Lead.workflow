<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>DealRegistrationAcknowledgement</fullName>
        <description>Deal Registration Acknowledgement</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>DealRegistrations/DealRegistrationAcknowledged</template>
    </alerts>
    <alerts>
        <fullName>DealRegistrationRejected</fullName>
        <description>Deal Registration Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>DealRegistrations/DealRegistrationRejected</template>
    </alerts>
    <alerts>
        <fullName>PartnerAcknowledgement</fullName>
        <description>Partner Acknowledgement</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>DealRegistrations/LeadChangedtoDealRegistration</template>
    </alerts>
    <alerts>
        <fullName>SendTCOWhitepapertoArchivedLeadswithNoBudgetindicated</fullName>
        <description>Send TCO Whitepaper to Archived Leads with &quot;No Budget&quot; indicated</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>MarketingTemplates/TCOWhitepaper</template>
    </alerts>
    <alerts>
        <fullName>Test</fullName>
        <description>Test</description>
        <protected>false</protected>
        <recipients>
            <field>Contact_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>InternalNotifications/LeadsNewassignmentnotificationSAMPLE</template>
    </alerts>
    <fieldUpdates>
        <fullName>ChangeLeadSource</fullName>
        <field>LeadSource</field>
        <literalValue>Deal Registration</literalValue>
        <name>Change Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ChangeLeadStatustoDraft</fullName>
        <field>Status</field>
        <literalValue>Draft</literalValue>
        <name>Change Lead Status to Draft</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ChangeRecordTypetoDealRegistration</fullName>
        <field>RecordTypeId</field>
        <lookupValue>DealRegistration</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Record Type to Deal Registration</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>HotLead</fullName>
        <field>Rating</field>
        <literalValue>Hot</literalValue>
        <name>Hot Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LeadStatusChange</fullName>
        <field>Status</field>
        <literalValue>Qualified - Convert</literalValue>
        <name>Lead Status Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Record_Type_Update</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Approved_Deal_Reg</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Lead Record Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Update</fullName>
        <field>LeadSource</field>
        <literalValue>Referral</literalValue>
        <name>Lead Source Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LowLeadScoreFieldUpdate</fullName>
        <field>Status</field>
        <literalValue>Working</literalValue>
        <name>Low Lead Score Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Lead_Twitter</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reg_Expiration_Date</fullName>
        <field>Registration_Expiration__c</field>
        <formula>Today()+60</formula>
        <name>Reg Expiration Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateApprovalStatustoApproved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Update Approval Status to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateApprovalStatustoRejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Update Approval Status to Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateApprovalStatustoSubmitted</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>Update Approval Status to Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateDealApprovedDate</fullName>
        <field>Deal_Approved_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Deal Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateDealExpirationDate</fullName>
        <field>Registration_Expiration__c</field>
        <formula>NOW() + 60</formula>
        <name>Update Deal Expiration Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateLeadStatustoApproved</fullName>
        <field>Status</field>
        <literalValue>Approved (Converted)</literalValue>
        <name>Update Lead Status to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateLeadStatustoRejected</fullName>
        <field>Status</field>
        <literalValue>Rejected</literalValue>
        <name>Update Lead Status to Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateLeadStatustoSubmitted</fullName>
        <field>Status</field>
        <literalValue>Submitted</literalValue>
        <name>Update Lead Status to Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WarmLead</fullName>
        <field>Rating</field>
        <literalValue>Warm</literalValue>
        <name>Warm Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Archived Lead%3A Budget</fullName>
        <actions>
            <name>SendTCOWhitepapertoArchivedLeadswithNoBudgetindicated</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Archived</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Disqual_Reason_1__c</field>
            <operation>equals</operation>
            <value>No Budget</value>
        </criteriaItems>
        <description>Send the &quot;Total Cost of Ownership&quot; Whitepaper to all archived leads where Disqual/Archive reason = No Budget</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>LEAD SCORE AUTO TASK</fullName>
        <actions>
            <name>HotLead</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LeadStatusChange</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ProductServicerelatedfollowupcall</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>SendProductServicesBrochure</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Total__c</field>
            <operation>greaterOrEqual</operation>
            <value>12</value>
        </criteriaItems>
        <description>2 Auto tasks when lead score is equal or greater than 15</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LOW LEAD SCORE FIELD UPDATE</fullName>
        <actions>
            <name>LowLeadScoreFieldUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>WarmLead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Total__c</field>
            <operation>lessThan</operation>
            <value>15</value>
        </criteriaItems>
        <description>Lead status change to Working if Lead Score below 15</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Record Type - Twitter</fullName>
        <actions>
            <name>Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>contains</operation>
            <value>Twitter</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Workflow - Follow-Up Assigned to Owner on Create</fullName>
        <actions>
            <name>NewLeadAssignedtoyouFollowupwithin24Hours</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Workflow demonstrates how a task can be assigned to a Sales Rep so Sales execs can hold SRs accountable for following up with their leads.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>NewLeadAssignedtoyouFollowupwithin24Hours</fullName>
        <assignedToType>owner</assignedToType>
        <description>A new lead has been assigned to you in Salesforce. Please follow up within 24 hours or your manager will be notified.

Thanks,
Sales Operations</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Lead Assigned to you. Follow up within 24 Hours</subject>
    </tasks>
    <tasks>
        <fullName>ProductServicerelatedfollowupcall</fullName>
        <assignedToType>owner</assignedToType>
        <description>Follow up call should be made 2 days after initial Brochure was sent to prospect.  Happy Selling!</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Product/Service related follow up call</subject>
    </tasks>
    <tasks>
        <fullName>SendProductServicesBrochure</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please send latest Product and Service brochure to prospect.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Send Product/Services Brochure</subject>
    </tasks>
</Workflow>
