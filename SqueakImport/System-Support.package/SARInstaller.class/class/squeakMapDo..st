package format support
squeakMapDo: aBlock
	"If SqueakMap is installed, evaluate aBlock with the default map.
	Otherwise, offer to install SqueakMap and continue."

	Smalltalk at: #SMSqueakMap ifPresent: [ :smClass | ^aBlock value: smClass default ].

	(self confirm: 'SqueakMap is not installed in this image.
Would you like to load it from the network?')
		ifTrue: [ TheWorldMenu loadSqueakMap.
			^self squeakMapDo: aBlock ].

	^nil