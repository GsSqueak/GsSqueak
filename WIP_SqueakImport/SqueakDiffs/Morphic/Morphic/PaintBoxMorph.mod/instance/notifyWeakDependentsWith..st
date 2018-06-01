actions
notifyWeakDependentsWith: arguments

	weakDependents ifNil: [^self].
	weakDependents do: [ :each |
		each ifNotNil: [
			each paintBoxChanged: arguments.
			each paintBoxChanged: {#changed. arguments second. true}.
		].
	].