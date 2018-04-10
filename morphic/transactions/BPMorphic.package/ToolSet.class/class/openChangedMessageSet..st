browsing
openChangedMessageSet: aChangeSet 
	"Open a ChangedMessageSet for aChangeSet"
	self default
		ifNil: [^ self inform: 'Cannot open MessageSet'].
	^ self default openChangedMessageSet: aChangeSet