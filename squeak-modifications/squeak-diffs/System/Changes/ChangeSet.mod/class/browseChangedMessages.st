current changeset
browseChangedMessages
	"Create and schedule a message browser on each method that has been 
	changed."

	current isEmpty ifTrue: [^ self inform: 'There are no changed messages
in the current change set.'].
	ToolSet openChangedMessageSet: current.