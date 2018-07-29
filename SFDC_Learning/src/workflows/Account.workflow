<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_when_account_rating_is_selected_as_cold</fullName>
        <description>Send email when account rating is selected as cold.</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SupportEscalatedCaseNotification</template>
    </alerts>
    <rules>
        <fullName>Rating Cold</fullName>
        <actions>
            <name>Send_email_when_account_rating_is_selected_as_cold</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Rating</field>
            <operation>equals</operation>
            <value>Cold</value>
        </criteriaItems>
        <description>Send email when Account Rating is set with value Cold.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Account_Rating_has_been_identified_as_cold</name>
                <type>Task</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Account_Rating_has_been_identified_as_cold</fullName>
        <assignedTo>pkrockstar2009@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Do whatever it takes to get account out of cold rating.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Account Rating has been identified as cold</subject>
    </tasks>
</Workflow>
