accessing
at: anInteger put: anObject 
	"Storing into an SqueakInterval is not allowed."
	self error: 'you can not store into an interval'