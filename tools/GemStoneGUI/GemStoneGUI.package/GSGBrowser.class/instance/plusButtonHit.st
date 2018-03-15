metaclass
plusButtonHit
	"Cycle among definition and comment"

	editSelection == #editComment ifTrue: [
		self editSelection: #editClass.
		(self hasClassSelected and: [self okToChange]) ifTrue: [
			self changed: #editComment.
			self contentsChanged].
		self decorateButtons.
		^ self].
	
	self editComment.
	self decorateButtons.