accessing
tempoMap: tempoEventList

	tempoEventList ifNil: [
		tempoMap := #().
		^ self].
	tempoMap := tempoEventList asArray.
