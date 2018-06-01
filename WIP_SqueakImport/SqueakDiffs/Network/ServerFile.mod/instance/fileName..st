as yet unclassified
fileName: aString

urlObject ~~ nil  "type == #file" 
	ifTrue: [urlObject path at: urlObject path size put: aString]
	ifFalse: [fileName := aString]