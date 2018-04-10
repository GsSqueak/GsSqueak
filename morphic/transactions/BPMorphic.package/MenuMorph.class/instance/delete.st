initialization
delete
	"Delete the receiver."
	activeSubMenu
		ifNotNil: [activeSubMenu stayUp
				ifFalse: [activeSubMenu delete]].
	self isFlexed
		ifTrue: [^ owner delete].
	^ super delete