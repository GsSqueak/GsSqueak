identification
monthDayTime24StringFrom: aSecondCount 
	"From the date/time represented by aSecondCount, produce a string
	which indicates the date and time in the compact form
	ddMMMhhmm		where dd is a two-digit day-of-month, MMM is the alpha
	month abbreviation and hhmm is the time on a 24-hr clock.
	
	Utilities monthDayTime24StringFrom: Time primSecondsCloc
	"
	| _gsSqueakTemp_aDate _gsSqueakTemp_aTime |
	_gsSqueakTemp_aDate := Date fromSeconds: aSecondCount.
	_gsSqueakTemp_aTime := Time fromSeconds: aSecondCount \\ 86400.
	^ _gsSqueakTemp_aDate dayOfMonth asTwoCharacterString
		, (_gsSqueakTemp_aDate monthName copyFrom: 1 to: 3) , _gsSqueakTemp_aTime hhmm24