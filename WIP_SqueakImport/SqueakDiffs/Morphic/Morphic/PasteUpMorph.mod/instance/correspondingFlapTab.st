flaps
correspondingFlapTab
	"If there is a flap tab whose referent is me, return it, else return nil.  Will also work for flaps on the edge of embedded subareas such as within scripting-areas, but more slowly."

	self currentWorld flapTabs do:
		[:aTab | aTab referent == self ifTrue: [^ aTab]].

	"Catch guys in embedded worldlets"
	ActiveWorld allMorphs do:
		[:aTab | ((aTab isKindOf: FlapTab) and: [aTab referent == self]) ifTrue: [^ aTab]].

	^ nil