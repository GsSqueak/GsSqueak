public
duplicateControlAndAltKeys: aBoolean
	"EventSensor duplicateControlAndAltKeys: true"

	Preferences setPreference: #duplicateControlAndAltKeys toValue: aBoolean.
	self installKeyDecodeTable
