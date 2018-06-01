private
removeAllHandlesBut: h
	"Remove all handles except h."
	(Preferences maintainHalos and:[h isNil])
		ifTrue:[self removeHalo]
		ifFalse:[
			submorphs copy do:
				[:m | m == h ifFalse: [m delete]]
		].
