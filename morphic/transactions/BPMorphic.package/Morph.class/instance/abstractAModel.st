-Etoys-card in a stack
abstractAModel
	"Find data-containing fields in me. Make a new class, whose instance
	variables are named for my fields, and whose values are the values I
	am showing. Use a CardPlayer for now. Force the user to name the
	fields. Make slots for text, Number Watchers, SketchMorphs, and
	ImageMorphs. "
	| _gsSqueakTemp_unnamed _gsSqueakTemp_ans _gsSqueakTemp_player _gsSqueakTemp_twoListsOfMorphs _gsSqueakTemp_holdsSepData _gsSqueakTemp_docks _gsSqueakTemp_instVarNames |
	self player
		ifNotNil: [:_gsSqueakTemp_oldPlayer | _gsSqueakTemp_oldPlayer belongsToUniClass
				ifTrue: ["Player"
					_gsSqueakTemp_oldPlayer class instVarNames notEmpty
						ifTrue: [self inform: 'I already have a regular Player, so I can''t have a CardPlayer'.
							^ true"success"]]].
	_gsSqueakTemp_twoListsOfMorphs := StackMorph discoverSlots: self.
	_gsSqueakTemp_holdsSepData := _gsSqueakTemp_twoListsOfMorphs first.
	_gsSqueakTemp_instVarNames := ''.
	_gsSqueakTemp_holdsSepData
		do: [:ea | 
			| iVarName |
			iVarName := Scanner wellFormedInstanceVariableNameFrom: ea knownName.
			iVarName = ea knownName
				ifFalse: [ea name: iVarName].
			_gsSqueakTemp_instVarNames := _gsSqueakTemp_instVarNames , iVarName , ' '].
	_gsSqueakTemp_unnamed := _gsSqueakTemp_twoListsOfMorphs second.
	"have default names"
	_gsSqueakTemp_instVarNames isEmpty
		ifTrue: [self inform: 'No named fields were found.
Please get a halo on each field and give it a name.
Labels or non-data fields should be named "shared xxx".'.
			^ false].
	_gsSqueakTemp_unnamed notEmpty
		ifTrue: [_gsSqueakTemp_ans := (UIManager default chooseFrom: #('All other fields are non-data fields' 'Stop.  Let me give a name to some more fields' ) title: 'Data fields are ' , _gsSqueakTemp_instVarNames printString , ('\Some fields are not named.  Are they labels or non-data fields?' , '\Please get a halo on each data field and give it a name.') withCRs)
						= 1.
			_gsSqueakTemp_ans
				ifFalse: [^ false]].
	_gsSqueakTemp_unnamed
		withIndexDo: [:mm :ind | mm setName: 'shared label ' , ind printString].
	"Make a Player with instVarNames. Make me be the costume"
	_gsSqueakTemp_player := CardPlayer instanceOfUniqueClassWithInstVarString: _gsSqueakTemp_instVarNames andClassInstVarString: ''.
	self player: _gsSqueakTemp_player.
	_gsSqueakTemp_player costume: self.
	"Fill in the instance values. Make docks first."
	_gsSqueakTemp_docks := OrderedCollection new.
	_gsSqueakTemp_holdsSepData
		do: [:morph | 
			morph setProperty: #shared toValue: true.
			"in case it is deeply embedded"
			morph setProperty: #holdsSeparateDataForEachInstance toValue: true.
			_gsSqueakTemp_player class compileInstVarAccessorsFor: morph knownName.
			morph isSyntaxMorph
				ifTrue: [morph setTarget: _gsSqueakTemp_player].
			"hookup the UpdatingString!"
			_gsSqueakTemp_docks addAll: morph variableDocks].
	_gsSqueakTemp_player class newVariableDocks: _gsSqueakTemp_docks.
	_gsSqueakTemp_docks
		do: [:dd | dd storeMorphDataInInstance: _gsSqueakTemp_player].
	"oldPlayer class mdict do: [:assoc | move to player].	move methods to
	new class?"
	"oldPlayer become: player."
	^ true"success"