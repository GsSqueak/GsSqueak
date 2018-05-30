user-interface
selectTabNamed: aName
	"If the receiver has a tab with the given name, select it"

	| aTab |
	aTab := self tabNamed: aName.
	aTab ifNotNil: [self selectTab: aTab]