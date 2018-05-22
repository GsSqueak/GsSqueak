e-toy support
allMorphsAndBookPagesInto: aSet
	"Return a set of all submorphs.  Don't forget the hidden ones like BookMorph pages that are not showing.  Consider only objects that are in memory (see allNonSubmorphMorphs)." 

	submorphs do: [:m | m allMorphsAndBookPagesInto: aSet].
	self allNonSubmorphMorphs do: [:m | 
			(aSet includes: m) ifFalse: ["Stop infinite recursion"
				m allMorphsAndBookPagesInto: aSet]].
	aSet add: self.
	self player ifNotNil:
		[self player allScriptEditors do: [:e | e allMorphsAndBookPagesInto: aSet]].
	^ aSet