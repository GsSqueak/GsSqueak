initialize-release
doubleClick: evt
	"the user has just tapped on the glass of the barometer, so move the priorPressureIndicator to match the current value"
	priorPressureIndicator rotationDegrees: needleMorph rotationDegrees