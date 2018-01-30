Nebraska support
assuredRemoteCanvas
	| newCanvas |
	self canvas notNil
		ifTrue: [^ self canvas].
	newCanvas := MultiCanvas new.
	newCanvas depth: 32.
	newCanvas extent: viewBox extent.
	self
		remoteCanvasesDo: [:c | newCanvas addCanvas: c].
	newCanvas addCanvas: Display getCanvas.
	"newCanvas := CachingCanvas on: newCanvas."
	self canvas: newCanvas.
	^ newCanvas