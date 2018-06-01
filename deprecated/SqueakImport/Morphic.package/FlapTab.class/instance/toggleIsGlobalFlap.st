globalness
toggleIsGlobalFlap
	"Toggle whether the receiver is currently a global flap or not"

	| oldWorld |
	self hideFlap.
	oldWorld := self currentWorld.
	self isGlobalFlap
		ifTrue:
			[Flaps removeFromGlobalFlapTabList: self.
			oldWorld addMorphFront: self]
		ifFalse:
			[self delete.
			Flaps addGlobalFlap: self.
			self currentWorld addGlobalFlaps].
	ActiveWorld reformulateUpdatingMenus
		