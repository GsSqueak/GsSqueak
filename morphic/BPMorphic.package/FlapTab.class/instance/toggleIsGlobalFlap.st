globalness
toggleIsGlobalFlap
	"Toggle whether the receiver is currently a global flap or not"
	| _gsSqueakTemp_oldWorld |
	self hideFlap.
	_gsSqueakTemp_oldWorld := self currentWorld.
	self isGlobalFlap
		ifTrue: [Flaps removeFromGlobalFlapTabList: self.
			_gsSqueakTemp_oldWorld addMorphFront: self]
		ifFalse: [self delete.
			Flaps addGlobalFlap: self.
			self currentWorld addGlobalFlaps].
	ActiveWorld reformulateUpdatingMenus