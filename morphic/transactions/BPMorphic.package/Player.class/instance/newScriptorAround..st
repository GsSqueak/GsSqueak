viewer
newScriptorAround: aPhrase 
	"Sprout a scriptor around aPhrase, thus making a new script. aPhrase
	may either be a PhraseTileMorph (classic tiles 1997-2001) or a
	SyntaxMorph (2001 onward)"
	| _gsSqueakTemp_aScriptEditor _gsSqueakTemp_aUniclassScript _gsSqueakTemp_tw _gsSqueakTemp_blk |
	_gsSqueakTemp_aUniclassScript := self class permanentUserScriptFor: self unusedScriptName player: self.
	_gsSqueakTemp_aScriptEditor := _gsSqueakTemp_aUniclassScript instantiatedScriptEditorForPlayer: self.
	Preferences universalTiles
		ifTrue: [_gsSqueakTemp_aScriptEditor install.
			"aScriptEditor hResizing: #shrinkWrap;
			vResizing: #shrinkWrap;
			cellPositioning: #topLeft;
			setProperty: #autoFitContents toValue: true."
			_gsSqueakTemp_aScriptEditor insertUniversalTiles.
			"Gets an empty SyntaxMorph for a MethodNode"
			_gsSqueakTemp_tw := _gsSqueakTemp_aScriptEditor findA: TwoWayScrollPane.
			aPhrase
				ifNotNil: [_gsSqueakTemp_blk := (_gsSqueakTemp_tw scroller findA: SyntaxMorph)
								findA: BlockNode.
					"MethodNode"
					_gsSqueakTemp_blk addMorphFront: aPhrase.
					aPhrase accept].
			SyntaxMorph setSize: nil andMakeResizable: _gsSqueakTemp_aScriptEditor]
		ifFalse: [aPhrase
				ifNil: [_gsSqueakTemp_aScriptEditor install]
				ifNotNil: [_gsSqueakTemp_aScriptEditor phrase: aPhrase
					"does an install"]].
	self class
		allSubInstancesDo: [:anInst | anInst scriptInstantiationForSelector: _gsSqueakTemp_aUniclassScript selector].
	"The above assures the presence of a ScriptInstantiation for the new
	selector in all siblings"
	self updateAllViewersAndForceToShow: #scripts.
	^ _gsSqueakTemp_aScriptEditor