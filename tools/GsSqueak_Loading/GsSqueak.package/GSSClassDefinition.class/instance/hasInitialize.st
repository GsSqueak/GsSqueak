testing
hasInitialize

	^ self classMethods anySatisfy: [:method | method selector = #initialize]