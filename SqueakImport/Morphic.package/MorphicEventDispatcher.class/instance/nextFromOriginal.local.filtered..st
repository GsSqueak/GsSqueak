support
nextFromOriginal: originalEvent local: localEvent filtered: filteredEvent
	"Take the filtered event if different but always keep the original coordinates."
	
	filteredEvent == localEvent
		ifTrue: [ "Use original event but keep track of ignored flag."
			localEvent wasHandled ifTrue: [originalEvent copyHandlerState: localEvent].
			originalEvent wasIgnored: localEvent wasIgnored.
			^ originalEvent]
		ifFalse: [ "There was an event transformation. Copy, revert coordinates, keep handler state."
			| result |
			result := filteredEvent copy. "Never mutate position without copying. MouseClickState etc. will break otherwise."
			result translateTo: originalEvent position. "restore to untransformed coordinates"
			result wasHandled ifFalse: [result copyHandlerState: originalEvent].
			^ result].
