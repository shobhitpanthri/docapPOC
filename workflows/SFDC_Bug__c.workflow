<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Blocker</fullName>
        <actions>
            <name>P1BlockerFound</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SFDC_Bug__c.Severity__c</field>
            <operation>equals</operation>
            <value>Blocker</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>P1BlockerFound</fullName>
        <assignedTo>spanthri@demo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>P1 Blocker Found</subject>
    </tasks>
</Workflow>
