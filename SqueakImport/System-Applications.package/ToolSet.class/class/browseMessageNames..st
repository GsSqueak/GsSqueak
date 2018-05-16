browsing
browseMessageNames: aString
	"Open a MessageNames browser"
	self default ifNil:[^self inform: 'No MessageNames present'].
	^self default browseMessageNames: aString