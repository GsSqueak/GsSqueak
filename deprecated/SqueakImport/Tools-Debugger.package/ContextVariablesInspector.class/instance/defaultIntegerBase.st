selecting
defaultIntegerBase
	"Answer the default base in which to print integers.
	 Defer to the class the code is compiled in."
	^[object method methodClass defaultIntegerBaseInDebugger]
		on: MessageNotUnderstood
		do: [:ex| 10]