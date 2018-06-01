as yet unclassified
getEvents: aWindow into: anArray
	<messageSendsInEnv: 0>
	| cArray cArrayClass |
	cArrayClass := GemstoneSmalltalk classNamed: #CByteArray.
	cArray := cArrayClass gcMalloc: 32.
	getEventsCo
		callWith: {
			aWindow.
			cArray}.
	1 to: 8 do: [ :each |
		anArray _env7 at: each put: (cArray uint32At: (each - 1) * 4) ]
