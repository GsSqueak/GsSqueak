transition
unhibernate
	"recreate my viewer"

	| wasShowing viewer |
	referent ifNotNil: [referent isViewer ifTrue: [^self]].
	wasShowing := flapShowing.
	"guard against not-quite-player-players"
	viewer := ((scriptedPlayer respondsTo: #costume) 
				and: [scriptedPlayer costume isMorph]) 
					ifTrue: [self presenter viewMorph: scriptedPlayer costume]
					ifFalse: [self presenter viewObjectDirectly: scriptedPlayer]. 
	wasShowing ifFalse: [self hideFlap].
	^viewer