globalness
isGlobalFlap
	"Answer whether the receiver is currently a shared flap"
	^ Flaps globalFlapTabsIfAny includes: self