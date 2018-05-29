track reading
isTempoTrack: anEventList
	"Return true if the given event list is non-empty and contains only tempo change events."

	anEventList isEmpty ifTrue: [^ false].
	anEventList do: [:evt | evt isTempoEvent ifFalse: [^ false]].
	^ true
