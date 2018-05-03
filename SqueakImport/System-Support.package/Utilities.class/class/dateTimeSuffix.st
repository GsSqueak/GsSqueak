identification
dateTimeSuffix
	"Answer a string which indicates the date and time, intended for use in building fileout filenames, etc."

	"Utilities dateTimeSuffix"
	^Preferences twentyFourHourFileStamps
		ifFalse:
			[self monthDayTimeStringFrom: Time totalSeconds]
		ifTrue:
			[self monthDayTime24StringFrom: Time totalSeconds]