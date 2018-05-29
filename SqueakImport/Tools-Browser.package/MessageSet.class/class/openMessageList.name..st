instance creation
openMessageList: anArray name: aString 
	"Create a standard system view for the message set on the list, anArray. 
	The label of the view is aString."

	self open: (self messageList: anArray) name: aString