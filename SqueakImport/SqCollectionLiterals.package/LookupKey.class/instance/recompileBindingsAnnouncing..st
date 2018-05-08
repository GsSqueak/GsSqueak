bindings
recompileBindingsAnnouncing: aBool 
	"Make the receiver (a global read-write binding) be a read-only binding"

	aBool 
		ifTrue: 
			[UIManager default informUserDuring: 
					[:bar | 
					(self systemNavigation allCallsOn: self) do: 
							[:mref | 
							bar value: 'Recompiling ' , mref asStringOrText.
							mref actualClass recompile: mref methodSymbol]]]
		ifFalse: 
			[(self systemNavigation allCallsOn: self) 
				do: [:mref | mref actualClass recompile: mref methodSymbol]]
