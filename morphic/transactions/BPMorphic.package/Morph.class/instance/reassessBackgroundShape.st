-Etoys-card in a stack
reassessBackgroundShape
	"A change has been made which may affect the instance structure of
	the Card uniclass that holds the instance state, which can also be
	thought of as the 'card data'."
	"Caution: still to be done: the mechanism so that when a new instance
	variable is added, it gets initialized in all subinstances of the receiver's
	player, which are the cards of this shape. One needs to take into
	account here the instance variable names coming in; those that are
	unchanged should keep their values, but those that have newly
	arrived should obtain their default values from the morphs on whose
	behalf they are being maintained in the model"
	| _gsSqueakTemp_requestedName |
	self isStackBackground
		ifFalse: [^ Beeper beep].
	"bulletproof against deconstruction"
	Cursor wait
		showWhile: [| variableDocks takenNames sepDataMorphs sorted existing |
			variableDocks := OrderedCollection new.
			"This will be stored in the uniclass's 
			class-side inst var #variableDocks"
			takenNames := OrderedCollection new.
			sepDataMorphs := OrderedCollection new.
			"fields, holders of per-card data"
			self submorphs
				do: [:aMorph | aMorph renderedMorph holdsSeparateDataForEachInstance
						ifTrue: [sepDataMorphs add: aMorph renderedMorph]
						ifFalse: ["look for buried fields, inside a frame"
							aMorph renderedMorph isShared
								ifTrue: [aMorph allMorphs
										do: [:mm | mm renderedMorph holdsSeparateDataForEachInstance
												ifTrue: [sepDataMorphs add: mm renderedMorph]]]]].
			sorted := SortedCollection new
						sortBlock: [:a :b | (a valueOfProperty: #cardInstance) notNil].
			"puts existing ones first"
			sorted addAll: sepDataMorphs.
			sorted
				do: [:aMorph | 
					| docks |
					docks := aMorph variableDocks.
					"Each morph can request multiple variables. 
					This complicates matters somewhat but creates a
					generality for Fabrk-like uses.
					Each spec is an instance of VariableDock, and it
					provides a point of departure
					for the negotiation between the PasteUp and its
					constitutent morphs"
					docks
						do: [:aVariableDock | 
							| uniqueName |
							uniqueName := self player uniqueInstanceVariableNameLike: (_gsSqueakTemp_requestedName := aVariableDock variableName) excluding: takenNames.
							uniqueName ~= _gsSqueakTemp_requestedName
								ifTrue: [aVariableDock variableName: uniqueName.
									aMorph noteNegotiatedName: uniqueName for: _gsSqueakTemp_requestedName].
							takenNames add: uniqueName].
					variableDocks addAll: docks].
			existing := self player class instVarNames.
			variableDocks := (variableDocks
						asSortedCollection: [:dock1 :dock2 | 
							| name2 name1 |
							name1 := dock1 variableName.
							name2 := dock2 variableName.
							(existing
								indexOf: name1
								ifAbsent: [0])
								< (existing
										indexOf: name2
										ifAbsent: [variableDocks size])]) asOrderedCollection.
			self player class
				setNewInstVarNames: (variableDocks
						collect: [:info | info variableName asString]).
			"NB: sets up accessors, and removes obsolete ones"
			self player class newVariableDocks: variableDocks]