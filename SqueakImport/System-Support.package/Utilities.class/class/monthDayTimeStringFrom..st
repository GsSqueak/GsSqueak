identification
monthDayTimeStringFrom: aSecondCount
	| aDate aTime |
	"From the date/time represented by aSecondCount, produce a string which indicates the date and time in the form:
		ddMMMhhmmPP	  where:
							dd is a two-digit day-of-month,
							MMM is the alpha month abbreviation,
							hhmm is the time,
							PP is either am or pm

          Utilities monthDayTimeStringFrom: Time primSecondsClock
"

	aDate := Date fromSeconds: aSecondCount.
	aTime := Time fromSeconds: aSecondCount \\ 86400.

	^ (aDate dayOfMonth asTwoCharacterString), 
		(aDate monthName copyFrom: 1 to: 3), 
		((aTime hours \\ 12) asTwoCharacterString), 
		(aTime minutes asTwoCharacterString),
		(aTime hours > 12 ifTrue: ['pm'] ifFalse: ['am'])