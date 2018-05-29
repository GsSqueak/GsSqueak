initialize-release
initialize
	models := OrderedCollection new.
	modelStates := OrderedCollection new.
	modelDependents := IdentitySet new.
	currentModelIndex := 0