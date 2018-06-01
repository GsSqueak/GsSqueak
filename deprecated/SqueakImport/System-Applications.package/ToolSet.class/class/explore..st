inspecting
explore: anObject
	"Open an explorer on the given object."
	self default ifNil:[^self inform: 'Cannot explore - no ToolSet present'].
	^self default explore: anObject