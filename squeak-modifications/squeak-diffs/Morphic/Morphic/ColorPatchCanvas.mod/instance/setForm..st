private
setForm: aForm
	"Initialize the receiver to act just as a FormCanvas"
	super setForm: aForm.
	stopMorph := nil.
	doStop := false.
	foundMorph := false.