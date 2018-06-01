saving
prePurge
	"Return self if ready to be purged, or nil if not"

	self isContentsInMemory ifFalse: [^ nil].
	contentsMorph ifNil: [^ nil].  "out already"
	url ifNil: [^ nil].	"just to be safe"
	^ (Project current world ~~ nil and: [contentsMorph world == Project current world]) 
		ifTrue: [nil "showing now"] ifFalse: [self]