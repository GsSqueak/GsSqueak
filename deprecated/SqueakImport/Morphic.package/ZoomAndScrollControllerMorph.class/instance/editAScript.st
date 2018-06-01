as yet unclassified
editAScript

	| d names reply s |
	d := self targetScriptDictionary.
	names := d keys asArray sort.
	reply := UIManager default chooseFrom: names values: names title: 'Script to edit?'.
	reply ifNil: [^ self].
	(s := ZASMScriptMorph new)
		decompileScript: (d at: reply) named: reply for: self;
		fullBounds;
		align: s center with: self center;
		openInWorld
	