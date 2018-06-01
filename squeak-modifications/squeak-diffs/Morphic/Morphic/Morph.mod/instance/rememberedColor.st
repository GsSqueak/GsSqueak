accessing
rememberedColor
	"Answer a rememberedColor, or nil if none"

	^ self valueOfProperty: #rememberedColor ifAbsent: [nil]