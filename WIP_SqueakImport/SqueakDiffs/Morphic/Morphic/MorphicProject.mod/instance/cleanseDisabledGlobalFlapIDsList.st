flaps support
cleanseDisabledGlobalFlapIDsList
	"Make certain that the items on the disabled-global-flap list are actually global flaps, and if not, get rid of them"

	| disabledFlapIDs currentGlobalIDs oldList |
	disabledFlapIDs := self parameterAt: #disabledGlobalFlapIDs ifAbsent: [Set new].
	currentGlobalIDs := Flaps globalFlapTabsIfAny collect: [:f | f flapID].
	oldList := Project current projectParameterAt: #disabledGlobalFlaps ifAbsent: [nil].
	oldList ifNotNil:
		[disabledFlapIDs := oldList select: [:aFlap | aFlap flapID]].
	disabledFlapIDs := disabledFlapIDs select: [:anID | currentGlobalIDs includes: anID].
	self projectParameterAt: #disabledGlobalFlapIDs put: disabledFlapIDs.

	self removeParameter: #disabledGlobalFlaps.
