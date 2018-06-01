accessing
nominalForm: aForm
	"Ascribe the blank nominal form"

	originalForm := aForm.
	self rotationCenter: 0.5@0.5.
	self layoutChanged
