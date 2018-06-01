updating
processUpdates
	"Process update files from a well-known update server.  This method is called at system startup time,   Only if the preference #updateFromServerAtStartup is true is the actual update processing undertaken automatically"
	| choice |
	(MCMcmUpdater updateFromServerAtStartup) ifTrue:
		[choice := UIManager default chooseFrom: #('Yes, Update' 'No, Not now' 'Don''t ask again')
			title: 'Shall I look for new code\updates on the server?' withCRs.
		choice = 1 ifTrue: [
			MCMcmUpdater updateFromServer].
		choice = 3 ifTrue: [
			MCMcmUpdater updateFromServerAtStartup: false.
			self inform: 'Remember to save your image to make this setting permant.']].
	^false