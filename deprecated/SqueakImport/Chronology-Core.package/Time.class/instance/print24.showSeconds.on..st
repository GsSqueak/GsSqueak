printing
print24: hr24 showSeconds: showSeconds on: aStream 
	"Format is 'hh:mm:ss' or 'h:mm:ss am'  or, if showSeconds is false, 'hh:mm' or 'h:mm am'"

	^self print24: hr24 showSeconds: showSeconds showSubseconds: false on: aStream 