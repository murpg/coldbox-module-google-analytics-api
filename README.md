coldbox-module-google-analytics-api
===================================

These are the instructions for setting up a ColdBox 4 module connecting to the Google Analytics API with oAuth 2.0
Get Analytics
Earlier this year one of our Federal clients asked me to attend a Google Analytics class that LunaMetrics was having here in DC. After taking this class I was inspired to put together this tutorial to document how to create a ColdBox module to connection to any Google Analytics account and do custom reporting. This module can be used in a ColdBox application.
One of my biggest complaints about most tutorials are that the author makes assumptions about the knowledge level of his users. Most of the time the assumptions are on the greater knowledge than as opposed to the lesser knowledge. Credit for the concepts and the original code go to Jen. You will need to generate your own credentials the ones you see in this document and video have been deleted. I am going to take you through the appropriate steps with screenshots:
1.	Download and setup ColdBox 4 through CommandBox
2.	Setup a Google Project to connect the Google Analytics API.
3.	Setting up an oAuth 2.0 account & apply to GA account.
4.	Downloading and setting up the Google API jar files
5.	Adding your parameters to connect to the GA API
6.	Connect through oAuth.
Let’s get started. You will need to have a site setup collecting Google Analytics data. That is out of the scope of this tutorial; however, if there is any interest I can show you how to do that. In the meantime information can be gathered at these URL’s:
Video:
https://www.youtube.com/watch?v=uyrKu-yb05c
Text:
https://support.google.com/analytics/answer/1008015?hl=en

Step 1 Setup ColdBox 4 through CommandBox
Go to Ortus Solutions web site. Click the third link from the left that says products and then click the CommandBox link. Download the appropriate package to a place that is easy for you navigate to. In this case I downloaded and unzipped it to D:\downloads\commandbox-jre-win64-1.0.0.
Open a CMD window and navigate to D:\downloads\commandbox-jre-win64-1.0.0



cd downloads\commandbox-jre-win64-1.0.0
 
Run the command box
 
This will transform the CMD windows into a CommandBox CLI. From here you will be able to install the ColdBox framework and skeleton of choice. It will be running a full blown CFML server. Let’s get started.
1.	CD to where you want to install CommandBox. I will install it at D:\projects\cb4F
2.	Next I will create the ColdBox 4 Framework
coldbox create app analytics --installColdBoxBE
 
3.	Let’s launch the server server start 52217 --force
 
4.	Let’s install the modules we will need such as javaloader from forgebox.
forgebox install javaloader
 
5.	Need to do some setup in our application. Copy the GA module to modules reboot the application and test.


 
Step 2 setting up a Google Project
Go to this URL to setup a Google Project:
 
Click on the create project button. In the new project dialog box fill in the project name and project id. In our case I am going to call the project name: MyProject1 and the project id: eastern-bridge-711
 
Once the project is created go to the left menu and select permissions. You will want to change that account to view (*******@appspot.gserviceaccount.com).  
Step 3
Right above the create API key window dialog box is the create client id. This enables oAuth 2.0 authentication. 
You will want to create that.
 
Here is what is created:
 
Client ID:
**************.apps.googleusercontent.com
Email Address:
**************@developer.gserviceaccount.com

Client Secret:
***********************

RedirectURIs:
http://localhost/
 
Step 4
Create a folder inside the root of the ColdBox app. Call this folder lib. Next you will want download all of the jar files from the Google Analytics Java API.

 




