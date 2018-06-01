Nebraska support
assuredRemoteCanvas
  | newCanvas |
  self halt.
  self canvas notNil
    ifTrue: [ ^ self canvas ].
  newCanvas := MultiCanvas new.
  newCanvas depth: 32.
  newCanvas extent: viewBox extent.
  self remoteCanvasesDo: [ :c | newCanvas addCanvas: c ].
  newCanvas addCanvas: (SessionTemps current at: #'Display') getCanvas.	"newCanvas := CachingCanvas on: newCanvas."
  self canvas: newCanvas.
  ^ newCanvas