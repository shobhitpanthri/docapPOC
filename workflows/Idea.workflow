<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Immediate_Attention_Needed</fullName>
        <description>Immediate Attention Needed</description>
        <protected>false</protected>
        <recipients>
            <recipient>SVPCustomerServiceSupport</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>InternalNotifications/SUPPORTNewassignmentnotificationSAMPLE</template>
    </alerts>
    <fieldUpdates>
        <fullName>Status_Update</fullName>
        <field>Status</field>
        <literalValue>Needs Review</literalValue>
        <name>Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Poor Language in Idea</fullName>
        <actions>
            <name>Immediate_Attention_Needed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Status_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Idea.Body</field>
            <operation>contains</operation>
            <value>Crappy,Worst</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
