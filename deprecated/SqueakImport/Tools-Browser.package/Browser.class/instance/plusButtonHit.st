class functions
plusButtonHit
	"Cycle among definition, comment, and hierachy"

	editSelection == #editComment ifTrue: [
		self hierarchy.
		self decorateButtons.
		^ self].
	
	editSelection == #hierarchy ifTrue: [
		self editSelection: #editClass.
		(self hasClassSelected and: [self okToChange]) ifTrue: [
			self changed: #editComment.
			self contentsChanged].
		self decorateButtons.
		^ self].
	
	self editComment.
	self decorateButtons.