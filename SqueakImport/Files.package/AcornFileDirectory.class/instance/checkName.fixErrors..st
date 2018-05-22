file name utilities
checkName: aFileName fixErrors: fixing
	"Check if the file name contains any invalid characters"
	| fName hasBadChars correctedName |
	fName := super checkName: aFileName fixErrors: fixing.
	correctedName := String streamContents:[:s|
								fName do:[:c|
									| newChar |
									(newChar := LegalCharMap at: c asciiValue +1) ifNotNil:[s nextPut: newChar]]]. 
	hasBadChars := fName ~= correctedName.
	(hasBadChars and:[fixing not]) ifTrue:[^self error:'Invalid file name'].
	hasBadChars ifFalse:[^ fName].
	^ correctedName