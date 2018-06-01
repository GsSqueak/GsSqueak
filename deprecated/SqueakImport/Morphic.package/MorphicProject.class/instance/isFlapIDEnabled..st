flaps support
isFlapIDEnabled:  aFlapID
	"Answer whether a flap of the given ID is enabled in this project"

	| disabledFlapIDs  |
	disabledFlapIDs := self parameterAt: #disabledGlobalFlapIDs ifAbsent: [^ true].
	^ (disabledFlapIDs includes: aFlapID) not