flaps support
assureFlapIntegrity
	"Make certain that the items on the disabled-global-flap list are actually global flaps, and if not, get rid of them.  Also, old (and damaging) parameters that held references to actual disabled flaps are cleansed"

	| disabledFlapIDs currentGlobalIDs oldList |
	disabledFlapIDs := self parameterAt: #disabledGlobalFlapIDs ifAbsent: [Set new].
	currentGlobalIDs := Flaps globalFlapTabsIfAny collect: [:f | f flapID].
	oldList := Project current projectParameterAt: #disabledGlobalFlaps ifAbsent: [nil].
	oldList ifNotNil:
		[disabledFlapIDs := oldList collect: [:aFlap | aFlap flapID].
		disabledFlapIDs addAll: {'Scripting' translated. 'Stack Tools' translated. 'Painting' translated}].
	disabledFlapIDs := disabledFlapIDs select: [:anID | currentGlobalIDs includes: anID].
	self projectParameterAt: #disabledGlobalFlapIDs put: disabledFlapIDs asSet.
	self assureNavigatorPresenceMatchesPreference.

	projectParameters ifNotNil:
		[projectParameters removeKey: #disabledGlobalFlaps ifAbsent: []]