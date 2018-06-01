public
swapControlAndAltKeys: aBoolean 
	"EventSensor swapControlAndAltKeys: true"
	Preferences setPreference: #swapControlAndAltKeys toValue: aBoolean.
	self installKeyDecodeTable