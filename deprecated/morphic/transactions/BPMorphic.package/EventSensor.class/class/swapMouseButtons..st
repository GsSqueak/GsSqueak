public
swapMouseButtons: aBoolean 
	"EventSensor swapMouseButtons: true"
	Preferences setPreference: #swapMouseButtons toValue: aBoolean.
	self installMouseDecodeTable