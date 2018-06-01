misc
secondsForDay: dayToken month: monthToken yearOrTime: ytToken 
thisMonth: thisMonth thisYear: thisYear

	| ftpDay ftpMonth pickAYear jDateToday trialJulianDate |

	ftpDay := dayToken asNumber.
	ftpMonth := Date indexOfMonth: monthToken.
	(ytToken includes: $:) ifFalse: [
		^(Date newDay: ftpDay month: ftpMonth year: ytToken asNumber) asSeconds
	].
	jDateToday := Date today dayOfYear.
	trialJulianDate := (Date newDay: ftpDay month: ftpMonth year: thisYear) dayOfYear.
	
	"Date has no year if within six months (do we need to check the day, too?)"

	"Well it appear to be pickier than that... it isn't just 6 months or 6 months and the day of the month, put perhaps the julian date AND the time as well. I don't know what the precise standard is, but this seems to produce better results"

	pickAYear := (jDateToday - trialJulianDate) > 182 ifTrue: [
		thisYear + 1	"his clock could be ahead of ours??"
	] ifFalse: [
		pickAYear := (trialJulianDate - jDateToday) > 182 ifTrue: [
			thisYear - 1
		] ifFalse: [
			thisYear
		].
	].
	^(Date newDay: ftpDay month: ftpMonth year: pickAYear) asSeconds +
		(Time readFrom: (ReadStream on: ytToken)) asSeconds

