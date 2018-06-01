submorphs-add/remove
dismissViaHalo
	"Dismiss the receiver (and its referent), unless it resists"
	self resistsRemoval
		ifTrue: [(UIManager default chooseFrom: #('Yes' 'Um, no, let me reconsider') title: 'Really throw this flap away?')
					= 2
				ifFalse: [^ self]].
	referent delete.
	self delete