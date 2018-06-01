browsing
browseClass: aClass 
	"Open a browser"
	self default
		ifNil: [^ self inform: 'Cannot open Browser'].
	^ self default browseClass: aClass