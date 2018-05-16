preferences
thoroughSenders
	"Accessor for the system-wide preference"
	
	<preference: 'Thorough senders.'
		category: #general
		description: 'If true, then ''senders'' browsers will dive inside structured literals in their search.'
		type: #Boolean>
	^ThoroughSenders ifNil: [ true ]