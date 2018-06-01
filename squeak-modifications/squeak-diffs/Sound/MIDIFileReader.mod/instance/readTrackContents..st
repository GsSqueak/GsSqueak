track reading
readTrackContents: byteCount

	| info |
	strings := OrderedCollection new.
	track := OrderedCollection new.
	trackStream := ReadStream on: (stream next: byteCount).
	activeEvents := OrderedCollection new.
	self readTrackEvents.
	(tracks isEmpty and: [self isTempoTrack: track])
		ifTrue: [tempoMap := track asArray]
		ifFalse: [
			"Note: Tracks without note events are currently not saved to
			 eliminate clutter in the score player. In control applications,
			 this can be easily changed by modifying the following test."
			(self trackContainsNotes: track) ifTrue: [
				tracks add: track asArray.
				info := WriteStream on: (String new: 100).
				strings do: [:s | info nextPutAll: s; cr].
				trackInfo add: info contents]].
	strings := track := trackStream := activeEvents := nil.
