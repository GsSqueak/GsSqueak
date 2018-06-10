diffing
collectMethodsIn: aClass

	| methodDict methodsToCollect |
	methodDict := Dictionary new.
	aClass ifNil: [^ methodDict].
	methodsToCollect := self methodsToCollectIn: aClass.
	aClass allMethods do: [:method |
		(methodsToCollect includes: method selector) ifTrue: [
			methodDict at: method selector put: method]].
	^ methodDict