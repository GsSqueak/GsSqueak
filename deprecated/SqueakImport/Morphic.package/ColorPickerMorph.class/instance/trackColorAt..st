private
trackColorAt: aGlobalPoint 
	"Before the mouse comes down in a modal color picker, track the color under the cursor, and show it in the feedback box, but do not make transparency changes"

	| selfRelativePoint pickedColor |
	selfRelativePoint := (self globalPointToLocal: aGlobalPoint) - self topLeft.
	(FeedbackBox containsPoint: selfRelativePoint) ifTrue: [^ self].
	(RevertBox containsPoint: selfRelativePoint)
		ifTrue: [^ self updateColor: originalColor feedbackColor: originalColor].

	"check for transparent color and update using appropriate feedback color "
	(TransparentBox containsPoint: selfRelativePoint) ifTrue: [^ self].

	"pick up color, either inside or outside this world"
	pickedColor := Display colorAt: aGlobalPoint.
	self updateColor: (pickedColor alpha: originalColor alpha)
		feedbackColor: pickedColor