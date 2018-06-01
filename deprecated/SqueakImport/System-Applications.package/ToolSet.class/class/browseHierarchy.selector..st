browsing
browseHierarchy: aClass selector: aSelector
	"Open a browser"
	self default ifNil:[^self inform: 'No browser present'].
	^self default browseHierarchy: aClass selector: aSelector