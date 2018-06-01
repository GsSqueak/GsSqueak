configuring
defaultCanvasType

	^Preferences postscriptStoredAsEPS ifTrue: [EPSCanvas] ifFalse: [DSCPostscriptCanvas]