accessing
tracks: trackList

	tracks := trackList asArray collect: [:trackEvents | trackEvents asArray].
	self ambientTrack.  "Assure it's not nil"