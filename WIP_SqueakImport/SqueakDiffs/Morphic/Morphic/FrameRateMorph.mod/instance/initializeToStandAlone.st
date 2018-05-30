parts bin
initializeToStandAlone
	"Initialize the receiver as a stand-alone entity"

	super initializeToStandAlone.
	self color: Color blue.
	self font: (Preferences standardMenuFont emphasized: 1).
	self step.
