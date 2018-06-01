object storage
comeFullyUpOnReload: smartRefStream
	"Normally this read-in object is exactly what we want to store.  Try to dock first.  If it is here already, use that one."

	| sp |
	"Transcript show: 'has ref to: ', url; cr."
	(sp := SqueakPageCache pageCache at: page ifAbsent: [nil]) ifNotNil: [
		sp isContentsInMemory ifTrue: [^ sp contentsMorph]].
	^ self