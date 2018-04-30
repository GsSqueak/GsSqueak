rectangle functions
swallow: aRectangle 
	"Modify the receiver so that it contains aRectangle."

	origin := origin min: aRectangle origin.
	corner := corner max: aRectangle corner