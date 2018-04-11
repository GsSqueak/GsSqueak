stepping
wantsSteps
  "Return true if the model wants its view to be stepped. For an open
	system window, we give the model to offer an opinion"

  self isPartsDonor
    ifTrue: [ ^ false ].
  self assuredPlayer wantsSteps
    ifTrue: [ ^ true ].
  ^ isCollapsed not and: [ model wantsStepsIn: self ]