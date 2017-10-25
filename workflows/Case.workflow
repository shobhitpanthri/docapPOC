<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Case_Escalation_Alert</fullName>
        <description>Case Escalation Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>spanthri@demo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>InternalNotifications/SUPPORTCaseescalationnotificationSAMPLE</template>
    </alerts>
    <alerts>
        <fullName>Customer_Case_Escalation_Notification</fullName>
        <description>Customer Case Escalation Notification</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>InternalNotifications/SUPPORTCustomerCaseescalationnotificationSAMPLE</template>
    </alerts>
    <alerts>
        <fullName>Pending_Case_Escalation</fullName>
        <description>Pending Case Escalation</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>InternalNotifications/SUPPORTCaseescalationnotificationSAMPLE</template>
    </alerts>
    <alerts>
        <fullName>ZMG__ZMG_Send_Survey_Email_to_Case_Contact_after_Case_Closed</fullName>
        <description>ZMG_Send Survey Email to Case Contact after Case Closed</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ZMG__Zoomerang_Templates/ZMG__ZMG_Case_Closed_Survey_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>BillingQueueUpdate</fullName>
        <description>This updates the owner of an inbound call to the billing queue, based on the case routing type equal to billing.</description>
        <field>OwnerId</field>
        <lookupValue>BillingQueue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Billing Queue Update</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BillingRecordTypeUpdate</fullName>
        <field>RecordTypeId</field>
        <lookupValue>BillingIssue</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Billing Record Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Priority_Change</fullName>
        <field>Priority</field>
        <literalValue>High</literalValue>
        <name>Case Priority Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Reassignement</fullName>
        <field>OwnerId</field>
        <lookupValue>Tier2EscalationQueue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Reassignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_billing_issue</fullName>
        <field>RecordTypeId</field>
        <lookupValue>BillingIssue</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change to billing issue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Complex</fullName>
        <field>RecordTypeId</field>
        <lookupValue>TechnicalIssueBasic</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Complex</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Desc_update</fullName>
        <field>Status</field>
        <literalValue>Escalated</literalValue>
        <name>Status update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Escalated</fullName>
        <field>IsEscalated</field>
        <literalValue>1</literalValue>
        <name>Escalated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Escalated_Case</fullName>
        <field>Status</field>
        <literalValue>Escalated</literalValue>
        <name>Escalated Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>High_Priority_Queue_reassignment</fullName>
        <field>OwnerId</field>
        <lookupValue>Tier2EscalationQueue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>High Priority Queue reassignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NewFeature</fullName>
        <field>RecordTypeId</field>
        <lookupValue>TechnicalIssueAdvanced</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>New Feature</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NewFeatureQueueUpdate</fullName>
        <description>This updates the owner of an inbound call to the product management queue when the new feature request case routing type is selected</description>
        <field>OwnerId</field>
        <lookupValue>ProductManagement</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>New Feature Queue Update</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Record_Type_Change</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Community_Case</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Record Type Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SLA_Time_Resume</fullName>
        <field>IsStopped</field>
        <literalValue>0</literalValue>
        <name>SLA Time Resume</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TechnicalQueueUpdate</fullName>
        <description>This updates the owner of an inbound call to the technical queue when the technical case routing type is selected.</description>
        <field>OwnerId</field>
        <lookupValue>Tier2EscalationQueue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Technical Queue Update</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TechnicalRecordTypeUpdate</fullName>
        <field>RecordTypeId</field>
        <lookupValue>TechnicalIssueBasic</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Technical Record Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Twitter_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Technical_Twitter</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Twitter Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Waiting_on_Customer</fullName>
        <field>IsStopped</field>
        <literalValue>1</literalValue>
        <name>Waiting on Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CASE ESCALATION</fullName>
        <actions>
            <name>Case_Escalation_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Case_Priority_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Case_Reassignement</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Escalated</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ACCOUNT_UPDATE_Case_Escalation_Alert</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Review_Escalated_Case_Immediately</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSS%3A Billing Case Routing</fullName>
        <actions>
            <name>BillingQueueUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BillingRecordTypeUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sendnewstatement</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Yourcustomerhadabillingquestion</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Case_Routing__c</field>
            <operation>equals</operation>
            <value>Billing</value>
        </criteriaItems>
        <description>Automatically routes an inbound case.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSS%3A New Feature Case Routing</fullName>
        <actions>
            <name>NewFeature</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>NewFeatureQueueUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>FeatureRequestSubmitted</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Case_Routing__c</field>
            <operation>equals</operation>
            <value>Feature Request</value>
        </criteriaItems>
        <description>Automatically routes an inbound case.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CSS%3A Technical Case Routing</fullName>
        <actions>
            <name>TechnicalQueueUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>TechnicalRecordTypeUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YourcustomerhasopenedaCase</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Case_Routing__c</field>
            <operation>equals</operation>
            <value>General/Technical</value>
        </criteriaItems>
        <description>Automatically routes an inbound case.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Chatter Answers</fullName>
        <actions>
            <name>Record_Type_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Chatter Answers</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Engineering Review</fullName>
        <actions>
            <name>Complex</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EngineeringReview</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Engineering_Review__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Installation  process</fullName>
        <actions>
            <name>Issue_RSA_Token_for_Machine</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Place_Order_with_Corporate_Express</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Set_up_Intranet_Access_and_Employee_ID</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Type</field>
            <operation>equals</operation>
            <value>Installation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Type__c</field>
            <operation>equals</operation>
            <value>New Installation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SLA TIMER RESUME</fullName>
        <actions>
            <name>SLA_Time_Resume</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Waiting on customer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Twitter Case Record Type</fullName>
        <actions>
            <name>Twitter_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>contains</operation>
            <value>Twitter</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>WAITING ON CUSTOMER</fullName>
        <actions>
            <name>Waiting_on_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Waiting on customer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>ZMG__ZMG_Case Closed Survey Completed</fullName>
        <actions>
            <name>ZMG__ZMG_Survey_Completed_by_Case_Contact</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.ZMG__ZMG_Survey_Completed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Task created when Zoomerang Survey is completed related to a closed Case.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>ZMG__ZMG_Case Closed Survey Sent</fullName>
        <actions>
            <name>ZMG__ZMG_Send_Survey_Email_to_Case_Contact_after_Case_Closed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>ZMG__ZMG_Survey_Sent_to_Case_Contact</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.ContactEmail</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Email sent to Case Contact with Zoomerang Survey when Case is Closed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>ACCOUNT_UPDATE_Case_Escalation_Alert</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please contact the referenced Case owner to follow up on the recently escalated ticket</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ACCOUNT UPDATE: Case Escalation Alert</subject>
    </tasks>
    <tasks>
        <fullName>Case_Ownership_Assignment_SLA_Violation_Review</fullName>
        <assignedTo>SVPCustomerServiceSupport</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Case Ownership Assignment SLA Violation Review</subject>
    </tasks>
    <tasks>
        <fullName>Case_Ownership_Needed_Priority_Alert</fullName>
        <assignedToType>owner</assignedToType>
        <description>Based on the Gold Level Coverage established for this Account&apos;s entitlement, we need to immediately assign ownership of this case</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Case Ownership Needed - Priority Alert</subject>
    </tasks>
    <tasks>
        <fullName>Case_ownership_Needed_High_Priority_Alert</fullName>
        <assignedTo>spanthri@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Based on the Gold Level Coverage established for this Account&apos;s entitlement, we need to immediately assign ownership of this case</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Case ownership Needed - High Priority Alert</subject>
    </tasks>
    <tasks>
        <fullName>EngineeringReview</fullName>
        <assignedTo>spanthri@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Engineering Review</subject>
    </tasks>
    <tasks>
        <fullName>FeatureRequestSubmitted</fullName>
        <assignedTo>spanthri@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Feature Request Submitted</subject>
    </tasks>
    <tasks>
        <fullName>High_Priority_Case_Review_Needed</fullName>
        <assignedTo>qengineer.0enwsosqedav.i4hby9fxjkhr.2lmbnvwrsrhl@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Stop trying to figure your swing out and help the customer</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>High Priority Case Review Needed</subject>
    </tasks>
    <tasks>
        <fullName>Issue_RSA_Token_for_Machine</fullName>
        <assignedTo>spanthri@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Issue RSA Token for Machine</subject>
    </tasks>
    <tasks>
        <fullName>New_Case</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please follow up with your account, they have an issue.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Case</subject>
    </tasks>
    <tasks>
        <fullName>Place_Order_with_Corporate_Express</fullName>
        <assignedTo>jsupport.rbghovim0tgf.r1s9q1mblikk.mssyucsnzd9a@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Place Order with Corporate Express</subject>
    </tasks>
    <tasks>
        <fullName>Review_Escalated_Case_Immediately</fullName>
        <assignedTo>eexec.21mtblmdirfa.juuhpxnm8em9.5bpdjcv9t28y@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Review Escalated Case Immediately</subject>
    </tasks>
    <tasks>
        <fullName>Sendnewstatement</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Send new statement</subject>
    </tasks>
    <tasks>
        <fullName>Set_up_Intranet_Access_and_Employee_ID</fullName>
        <assignedTo>wwest.dqrc5aopisoc.7qofsjkfy8bg.ywqetgxnywuh@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Set up Intranet Access and Employee ID</subject>
    </tasks>
    <tasks>
        <fullName>Yourcustomerhadabillingquestion</fullName>
        <assignedToType>accountOwner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Your customer had a billing question</subject>
    </tasks>
    <tasks>
        <fullName>YourcustomerhasopenedaCase</fullName>
        <assignedToType>accountOwner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Your customer has opened a Case</subject>
    </tasks>
    <tasks>
        <fullName>ZMG__ZMG_Survey_Completed_by_Case_Contact</fullName>
        <assignedToType>owner</assignedToType>
        <description>Copy and paste this link to view the Survey:
[Insert public survey URL here for reference]</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Survey Completed : &apos;Customer Satisfaction with Customer Service&apos;</subject>
    </tasks>
    <tasks>
        <fullName>ZMG__ZMG_Survey_Sent_to_Case_Contact</fullName>
        <assignedToType>owner</assignedToType>
        <description>Copy and paste this link to view the Survey:
[Insert public survey URL here for reference]</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Survey Sent : &apos;Customer Satisfaction with Customer Service&apos;</subject>
    </tasks>
</Workflow>
