updating
applyUserInterfaceTheme
	"Re-initialize the shadow. Ensure shadow cache invalidation."
	self hasDropShadow
		ifTrue: [self addDropShadow.
			self removeProperty: #dropShadow.
			self changed]