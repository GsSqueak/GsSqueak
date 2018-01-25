accessing
tempNames
	"Answer the string, containing the temps names or nil "
	^ (kind == #TempsNamesQCompress or: [ kind == #TempsNamesZip ]) 
		ifTrue: [ data ] ifFalse: [ nil ]