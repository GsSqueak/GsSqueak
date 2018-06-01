browsing
browse: aClass selector: aSelector 
	"Open a browser"
	self default
		ifNil: [^ self inform: 'Cannot open Browser'].
	^ self default browse: aClass selector: aSelector