accessing
colorForInsets
	"My submorphs use the surrounding color"
	owner notNil and:
		[ owner color isColor ifTrue: [ ^ owner color ] ].
	^ Color white