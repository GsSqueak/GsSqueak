initialize-release
temps: tempVars literals: lits class: cl 
	"Initialize this encoder for decompilation."
	self
		setCue: (SqCompilationCue class: cl).
	supered := false.
	nTemps := tempVars size.
	tempVars
		do: [:node | scopeTable at: node name put: node].
	literalStream := WriteStream
				on: (Array new: lits size).
	literalStream nextPutAll: lits.
	sourceRanges := Dictionary new: 32.
	globalSourceRanges := OrderedCollection new: 32