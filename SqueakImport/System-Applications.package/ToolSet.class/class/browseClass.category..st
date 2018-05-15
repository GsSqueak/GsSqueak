browsing
browseClass: aClass category: aCategory
	"Open a browser"
	self default ifNil:[^self inform: 'Cannot open Browser'].
	^self default browseClass: aClass category: aCategory