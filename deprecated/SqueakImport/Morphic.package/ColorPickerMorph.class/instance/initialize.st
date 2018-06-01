initialization
initialize
	"Initialize the receiver.  Obey the modalColorPickers preference when deciding how to configure myself.  This is not quite satisfactory -- we'd like to have explicit calls tell us things like whether whether to be modal, whether to allow transparency, but for the moment, in grand Morphic fashion, this is rather inflexibly all housed right here"

	super initialize.
	self clipSubmorphs: true.
	self buildChartForm.
	
	selectedColor := Color white.
	sourceHand := nil.
	deleteOnMouseUp := false.
	clickedTranslucency := false.
	updateContinuously := true.
	selector := nil.
	target := nil