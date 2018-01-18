flaps
correspondingFlapTab	"If there is a flap tab whose referent is me, return it, else return nil"	self currentWorld flapTabs		do: [:aTab | aTab referent == self				ifTrue: [^ aTab]].	^ nil