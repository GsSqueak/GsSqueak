private
canBeEncroached
	^ submorphs allSatisfy:
		[ : each | each canBeEncroached ]