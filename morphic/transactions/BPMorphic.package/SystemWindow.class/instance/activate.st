focus
activate
	"Bring the receiver to the top. If I am modal, bring along my modal
	owning window and my model child as well."
	self isActive
		ifTrue: [self lookFocused.
			^ self"avoid spurious activate when drop in trash"].
	self topRendererOrSelf owner
		ifNil: [^ self"avoid spurious activate when drop in trash"].
	self isActive: true.
	"Special handling for expanded windows."
	self isCollapsed
		ifFalse: [model modelWakeUpIn: self.
			self positionSubmorphs].
	self
		submorphsDo: [:each | each unlock].
	self lookFocused