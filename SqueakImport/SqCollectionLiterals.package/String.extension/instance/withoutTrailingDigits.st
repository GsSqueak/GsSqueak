*SqCollectionLiterals-converting
withoutTrailingDigits
	"Answer the portion of the receiver that precedes any trailing series of digits and blanks.  If the receiver consists entirely of digits and blanks, return an empty string"
	| i |
	i := self size.
	[i > 0] whileTrue: [ 
		((self at: i) isDigit or: [ (self at: i) = $ ]) ifFalse: [
			^ self copyFrom: 1 to: i
		].
		i := i - 1.
	].
	^ ''
	

"
'Whoopie234' withoutTrailingDigits
'Lucida Grande 15' withoutTrailingDigits
' 4321 BlastOff!' withoutLeadingDigits
'wimpy' withoutLeadingDigits
'  89Ten ' withoutLeadingDigits
'78 92' withoutLeadingDigits
"
