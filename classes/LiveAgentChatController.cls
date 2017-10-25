//  Copyright (c) 2012, Odhrán Lenaghan, Sales Support Engineer, Salesforce.com Inc.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//  Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
//  Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//  Neither the name of the salesforce.com nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. 

//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
//  INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
//  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

public with sharing class LiveAgentChatController {

    public LiveChatButton lCBId {get; set;}
    public String liveChatBtnId{get; set;}    
    
    public LiveChatDeployment lDId {get; set;}
    public String liveChatDepId{get; set;}
    
    public Contact liveAgentUser {get; set;}
    public String liveAgentUserEmail {get; set;}
    public String liveAgentUserName {get; set;}
    
    public LiveAgentChatController(){
    
        lCBId = [SELECT Id FROM LiveChatButton LIMIT 1];
        
        lDId = [SELECT Id FROM LiveChatDeployment LIMIT 1];
        
        liveChatBtnId = String.valueOf(lCBId.id); 
        liveChatDepId = String.valueOf(lDId.id);
        
        liveAgentUser = [SELECT FirstName, LastName, Email from Contact Where ActiveLiveAgentUser__c =: true limit 1];
        
        liveAgentUserEmail = String.valueOf(liveAgentUser.Email);
        liveAgentUserName = String.valueOf(liveAgentUser.FirstName)+' '+String.valueOf(liveAgentUser.LastName);
    }
}