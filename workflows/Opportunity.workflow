<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>DealRegistrationConverted</fullName>
        <description>Deal Registration Converted</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>DealRegistrations/DealRegistrationApproved</template>
    </alerts>
    <alerts>
        <fullName>DiscountApprovedemailnotification</fullName>
        <description>Discount Approved email notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ApprovalWorkflow/DiscountApproved</template>
    </alerts>
    <alerts>
        <fullName>DiscountRejected</fullName>
        <description>Discount Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ApprovalWorkflow/DiscountRejected</template>
    </alerts>
    <alerts>
        <fullName>DiscountRejectedemailnotification</fullName>
        <description>Discount Rejected email notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ApprovalWorkflow/DiscountRejected</template>
    </alerts>
    <alerts>
        <fullName>NotifyDealRegOpptAccountOwnerthatdealisClosedWon</fullName>
        <description>Notify Deal Reg Oppt Account Owner that deal is Closed Won</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>DealRegistrations/DealRegistrationClosedWon</template>
    </alerts>
    <alerts>
        <fullName>Wejustclosedagreatdeal</fullName>
        <description>We just closed a great deal!</description>
        <protected>false</protected>
        <recipients>
            <recipient>Account Manager</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>Channel Manager</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>Channel Partner</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>Executive Sponsor</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>Lead Qualifier</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>Pre-Sales Consultant</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>Sales Manager</recipient>
            <type>accountTeam</type>
        </recipients>
        <recipients>
            <recipient>spanthri@demo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SalesTemplates/BigDealAlert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Amount_Update</fullName>
        <field>Amount</field>
        <formula>1</formula>
        <name>Amount Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ClosedDateequalToday</fullName>
        <field>CloseDate</field>
        <formula>Today()</formula>
        <name>Closed Date equal Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DiscountApproved</fullName>
        <field>Discount_Approved__c</field>
        <literalValue>Yes</literalValue>
        <name>Discount Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Updated</fullName>
        <field>StageName</field>
        <literalValue>Negotiation/Review</literalValue>
        <name>Status Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Big Deal Alert</fullName>
        <actions>
            <name>Wejustclosedagreatdeal</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterThan</operation>
            <value>100000</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Close Date equals date of close</fullName>
        <actions>
            <name>ClosedDateequalToday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Deal Registration Closed Won</fullName>
        <actions>
            <name>NotifyDealRegOpptAccountOwnerthatdealisClosedWon</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Indirect (Partner)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Deal Registration</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <description>Sent to opportunity account owner when a deal registration opportunity is closed won</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Deal Registration Converted</fullName>
        <actions>
            <name>DealRegistrationConverted</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Deal Registration</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Indirect (Partner)</value>
        </criteriaItems>
        <description>Fires when a lead of record type registration is converted</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Opportunity</fullName>
        <actions>
            <name>Amount_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>OPPORTUNITY QUOTE TASKS</fullName>
        <actions>
            <name>Status_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Customer_Service_History_Review</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Issued_Quote_Review</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Quote_Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Quote_Delivered__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Workflow - Send Task to Owner on Stage Change</fullName>
        <actions>
            <name>SendProposalandPricing</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Proposal/Price Quote</value>
        </criteriaItems>
        <description>Workflow demonstrates how a task can be assigned to a Sales Rep or other User when the Opportunity stage changes. Change this to match the prospect&apos;s sales stage and task name you mention in your flow.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Customer_Service_History_Review</fullName>
        <assignedTo>jsupport.rbghovim0tgf.r1s9q1mblikk.mssyucsnzd9a@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please review the Service history for this account immediately and alert Opportunity owner if there are any pending issues outstanding that they should be aware of.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Customer Service History Review</subject>
    </tasks>
    <tasks>
        <fullName>Issued_Quote_Review</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please review the referenced Opportunity and ensure quote provided adheres to pricing and guidelines for your account</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Issued Quote Review</subject>
    </tasks>
    <tasks>
        <fullName>Quote_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please follow up with deleivered quote to ensure pricing and traction.</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Quote Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>SendProposalandPricing</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Send Proposal and Pricing</subject>
    </tasks>
</Workflow>
