support
widgetColor
	"Answer color from widget"
	self subclassResponsibility

	"NOTE: You can bail out if you don't know how to get the color from the widget:
		^self getColor
	will work."