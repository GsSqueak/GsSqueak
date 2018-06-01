focus
activate
	"An active window delegate user input events as usual to its contents such as buttons or lists. There is a preference to ensure that all windows stay active regardless of being focused or not. Also take a look at #passivate, #lookFocused, and #beKeyWindow."
	
	self isActive ifTrue: [self lookFocused. ^ self].
	self topRendererOrSelf owner ifNil: [^ self "avoid spurious activate when drop in trash"].
	
	self isActive: true.
			
	"Special handling for expanded windows."
	self isCollapsed ifFalse: [
		model modelWakeUpIn: self.
		self positionSubmorphs].

	self submorphsDo: [:each | each unlock].

	self lookFocused.