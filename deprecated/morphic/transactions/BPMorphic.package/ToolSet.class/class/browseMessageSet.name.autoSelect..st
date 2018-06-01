browsing
browseMessageSet: messageList name: title autoSelect: autoSelectString 
	"Open a message set browser"
	self default
		ifNil: [^ self inform: 'Cannot open MessageSet'].
	^ self default
		browseMessageSet: messageList
		name: title
		autoSelect: autoSelectString