other
clippingTo: aRect do: aBlock 
	"Display clippingTo: Rectangle fromUser do:
	[ScheduledControllers restore: Display fullBoundingBox]"
	| saveClip |
	saveClip := clippingBox.
	clippingBox := aRect.
	aBlock value.
	clippingBox := saveClip