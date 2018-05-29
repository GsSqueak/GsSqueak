copying
veryDeepInner: deepCopier
	"Copy all of my instance variables.  Some need to be not copied at all, but shared.  	Warning!!  Every instance variable defined in this class must be handled.  We must also implement veryDeepFixupWith:.  See DeepCopier class comment."

super veryDeepInner: deepCopier.
"hostView := hostView.		Weakly copied"
	"stampForm := stampForm veryDeepCopyWith: deepCopier."
	"canvasRectangle := canvasRectangle veryDeepCopyWith: deepCopier."
palette := palette veryDeepCopyWith: deepCopier.
	"currentColor := currentColor veryDeepCopyWith: deepCopier."
ticksToDwell := ticksToDwell veryDeepCopyWith: deepCopier.
rotationCenter := rotationCenter veryDeepCopyWith: deepCopier.
registrationPoint := registrationPoint veryDeepCopyWith: deepCopier.
newPicBlock := newPicBlock veryDeepCopyWith: deepCopier.
emptyPicBlock := emptyPicBlock veryDeepCopyWith: deepCopier.
	"action := action veryDeepCopyWith: deepCopier."
paintingForm := paintingForm veryDeepCopyWith: deepCopier.
dimForm := dimForm veryDeepCopyWith: deepCopier.
	"buff := buff veryDeepCopyWith: deepCopier."
	"brush := brush veryDeepCopyWith: deepCopier."
	"paintingFormPen := paintingFormPen veryDeepCopyWith: deepCopier."
formCanvas := formCanvas veryDeepCopyWith: deepCopier.
	"picToBuff := picToBuff veryDeepCopyWith: deepCopier."
	"brushToBuff := brushToBuff veryDeepCopyWith: deepCopier."
	"buffToBuff := buffToBuff veryDeepCopyWith: deepCopier."
	"buffToPic := buffToPic veryDeepCopyWith: deepCopier."
rotationButton := rotationButton veryDeepCopyWith: deepCopier.
scaleButton := scaleButton veryDeepCopyWith: deepCopier.
	"strokeOrigin := strokeOrigin veryDeepCopyWith: deepCopier."
cumRot := cumRot veryDeepCopyWith: deepCopier.
cumMag := cumMag veryDeepCopyWith: deepCopier.
undoBuffer := undoBuffer veryDeepCopyWith: deepCopier.
	"lastEvent := lastEvent veryDeepCopyWith: deepCopier."
	"currentNib := currentNib veryDeepCopyWith: deepCopier."
enclosingPasteUpMorph := enclosingPasteUpMorph.	"weakly copied"
forEachHand := nil.	"hmm..."                              