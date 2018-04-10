identification
monthDayTimeStringFrom: aSecondCount 
	"From the date/time represented by aSecondCount, produce a string
	which indicates the date and time in the form:
	ddMMMhhmmPP	 where:
	dd is a two-digit day-of-month,
	MMM is the alpha month abbreviation,
	hhmm is the time,
	PP is either am or pm
	
	Utilities monthDayTimeStringFrom: Time primSecondsCloc
	"
	| _gsSqueakTemp_aDate _gsSqueakTemp_aTime |
	_gsSqueakTemp_aDate := Date fromSeconds: aSecondCount.
	_gsSqueakTemp_aTime := Time fromSeconds: aSecondCount \\ 86400.
	^ _gsSqueakTemp_aDate dayOfMonth asTwoCharacterString
		, (_gsSqueakTemp_aDate monthName copyFrom: 1 to: 3) , (_gsSqueakTemp_aTime hours \\ 12) asTwoCharacterString , _gsSqueakTemp_aTime minutes asTwoCharacterString
		, (_gsSqueakTemp_aTime hours > 12
				ifTrue: ['pm']
				ifFalse: ['am'])