selecting
defaultIntegerBase
	"Answer the default base in which to print integers.
	 Defer to the class of the instance."
	^[object class defaultIntegerBaseInDebugger]
		on: MessageNotUnderstood
		do: [:ex| 10]