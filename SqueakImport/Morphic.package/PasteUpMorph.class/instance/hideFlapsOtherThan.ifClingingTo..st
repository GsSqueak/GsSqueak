misc
hideFlapsOtherThan: aFlapTab ifClingingTo: anEdgeSymbol
	"Hide flaps on the given edge unless they are the given one"

	self flapTabs do:
		[:aTab | (aTab edgeToAdhereTo == anEdgeSymbol)
			ifTrue:
				[aTab  == aFlapTab
					ifFalse:
						[aTab hideFlap]]]