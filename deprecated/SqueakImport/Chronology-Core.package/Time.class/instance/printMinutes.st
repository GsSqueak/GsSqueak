printing
printMinutes
	"Return as string 'hh:mm pm'  "

	^String streamContents:
		[ :aStream | self print24: false showSeconds: false on: aStream ]