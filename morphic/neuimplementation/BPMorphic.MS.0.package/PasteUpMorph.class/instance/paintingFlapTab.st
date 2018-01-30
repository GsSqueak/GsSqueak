flaps
paintingFlapTab
	"If the receiver has a flap which has a paintbox, return it, else return
	nil "
	self flapTabs
		do: [:aTab | aTab referent
				submorphsDo: [:aMorph | (aMorph isKindOf: PaintBoxMorph)
						ifTrue: [^ aTab]]].
	^ nil