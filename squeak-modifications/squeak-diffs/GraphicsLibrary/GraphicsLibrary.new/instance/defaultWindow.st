as yet unclassified
defaultWindow
  defaultWindow ifNil: [ defaultWindow := self createWindow: 640 @ 480 ].
  ^ defaultWindow