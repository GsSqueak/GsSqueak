browsing
browseVersionsOf: aClass selector: aSelector
	"Open a browser"
	self default ifNil:[^self inform: 'Cannot open Browser'].
	^self default browseVersionsOf: aClass selector: aSelector