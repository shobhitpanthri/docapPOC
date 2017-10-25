<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>ApprovalandPaymentComplete</fullName>
        <description>Approval and Payment Complete</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ApprovalWorkflow/DiscountApproved</template>
    </alerts>
    <fieldUpdates>
        <fullName>ChangetoRejected</fullName>
        <field>Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Change to Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PaymentComplete</fullName>
        <field>Status__c</field>
        <literalValue>Payment Complete</literalValue>
        <name>Payment Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdatetoApproved</fullName>
        <field>Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Update to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <tasks>
        <fullName>PleaseReviewExpenseReport</fullName>
        <assignedToType>owner</assignedToType>
        <description>Your expense report has been rejected.  Please review the comments from the approver and resubmit.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Please Review Expense Report</subject>
    </tasks>
    <tasks>
        <fullName>ProcessPayment</fullName>
        <assignedTo>spanthri@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Process Payment</subject>
    </tasks>
</Workflow>
