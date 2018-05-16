browsing
browseMessageCategory: aCategory inClass: aClass
	"Open a message category browser."
	self default ifNil:[^self inform: 'Cannot open Browser'].
	^self default browseMessageCategory: aCategory inClass: aClass