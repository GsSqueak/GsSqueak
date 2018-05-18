world state
install
	owner := nil.	"since we may have been inside another world previously"
	ActiveWorld := self.
	ActiveHand := self hands first.	"default"
	ActiveEvent := nil.
	submorphs do: [:ss | ss owner isNil ifTrue: [ss privateOwner: self]].
	"Transcript that was in outPointers and then got deleted."
	self viewBox: Display boundingBox.
	Sensor flushAllButDandDEvents.
	worldState handsDo: [:h | h initForEvents].
	self installFlaps.
	self borderWidth: 0.	"default"
	(Preferences showSecurityStatus 
		and: [SecurityManager default isInRestrictedMode]) 
			ifTrue: 
				[self
					borderWidth: 2;
					borderColor: Color red].
	self presenter allExtantPlayers do: [:player | player prepareToBeRunning].
	SystemWindow noteTopWindowIn: self.