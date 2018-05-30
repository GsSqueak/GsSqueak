fileIn/Out
askRemovedInstVars: classList
	| pairList pairClasses index pls |
	"Ask the author whether these newly removed inst vars need to have their info saved"

	pairList := OrderedCollection new.
	pairClasses := OrderedCollection new.
	"Class version numbers:  If it must change, something big happened.  Do need a conversion method then.  Ignore them here."
	classList do: [:cls | | oldStruct newStruct |
		newStruct := (cls allInstVarNames).
		oldStruct := (structures at: cls name ifAbsent: [#(0), newStruct]) allButFirst.
		oldStruct do: [:instVarName |
			(newStruct includes: instVarName) ifFalse: [
				pairList add: cls name, ' ', instVarName.
				pairClasses add: cls]]].

	pairList isEmpty ifTrue: [^ #()].
	[index := UIManager default 
		chooseFrom: pairList, #('all of these need a conversion method'
						'all of these have old values that can be erased')
			title:
'These instance variables were removed.
When an old project comes in, instance variables 
that have been removed will lose their contents.
Click on items to remove them from the list.
Click on any whose value is unimportant and need not be saved.'.
	(index <= (pls := pairList size)) & (index > 0) ifTrue: [
		pairList removeAt: index.
		pairClasses removeAt: index].
	index = (pls + 2) ifTrue: ["all are OK" ^ #()].
	pairList isEmpty | (index = (pls + 1))  "all need conversion, exit"] whileFalse.

	^ pairClasses asSet asArray	"non redundant"