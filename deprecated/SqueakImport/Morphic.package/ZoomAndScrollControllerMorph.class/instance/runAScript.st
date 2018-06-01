as yet unclassified
runAScript

	| d names reply |
	d := self targetScriptDictionary.
	names := d keys asArray sort.
	reply := UIManager default chooseFrom: names values: names title: 'Script to run?'.
	reply ifNil: [^ self].
	programmedMoves := (d at: reply) veryDeepCopy.