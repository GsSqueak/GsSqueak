e-toy support
baseGraphic
	"Answer my base graphic"

	^ self valueOfProperty: #baseGraphic ifAbsent:
		[self setProperty: #baseGraphic toValue: originalForm.
		^ originalForm]