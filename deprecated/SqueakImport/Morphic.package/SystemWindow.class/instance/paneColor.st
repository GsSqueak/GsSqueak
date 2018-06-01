colors
paneColor
	| cc |
	(cc := self valueOfProperty: #paneColor) ifNotNil: [^cc].
	(model respondsTo: #windowColorToUse) ifTrue: [cc := model windowColorToUse].
	cc ifNil: [cc := paneMorphs isEmptyOrNil ifFalse: [paneMorphs first color]].
	cc ifNil: [cc := self defaultColor].
	self paneColor: cc.
	^cc