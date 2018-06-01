-Etoys-support
fire
	"If the receiver has any kind of button-action defined, fire that action
	now. Any morph can have special, personal mouseUpCodeToRun, and
	that will be triggered by this. Additionally, some morphs have specific
	buttonness, and these get sent the #doButtonAction message to
	carry out their firing. Finally, some morphs have mouse behaviors
	associated with one or more Player scripts.
	For the present, we'll try out doing *all* the firings this object can do."
	self firedMouseUpCode.
	"This will run the mouseUpCodeToRun, if any"
	self player
		ifNotNil: [self player fireOnce].
	"Run mouseDown and mouseUp scripts"
	self doButtonAction
	"Do my native button action, if any"