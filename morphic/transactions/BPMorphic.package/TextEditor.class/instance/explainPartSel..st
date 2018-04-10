explain
explainPartSel: string 
	"Is this a fragment of a multiple-argument selector sent in this
	method? "
	| _gsSqueakTemp_lits _gsSqueakTemp_whole _gsSqueakTemp_reply _gsSqueakTemp_classes _gsSqueakTemp_s _gsSqueakTemp_msg |
	(model respondsTo: #selectedMessageName)
		ifFalse: [^ nil].
	(_gsSqueakTemp_msg := model selectedMessageName)
		ifNil: [^ nil].
	"not in a message"
	string last == $:
		ifFalse: [^ nil].
	"Name of this method"
	_gsSqueakTemp_lits := Array with: _gsSqueakTemp_msg.
	(_gsSqueakTemp_whole := _gsSqueakTemp_lits
					detect: [:each | each keywords
							anySatisfy: [:frag | frag = string]]
					ifNone: []) ~~ nil
		ifTrue: [_gsSqueakTemp_reply := ', which is the selector of this very method!'.
			_gsSqueakTemp_s := '.  To see the other definitions, go to the message list pane, get the menu from the top of the scroll bar, and select ''implementors of...''."']
		ifFalse: ["Selectors called from this method"
			_gsSqueakTemp_lits := (model selectedClassOrMetaClass compiledMethodAt: _gsSqueakTemp_msg) messages.
			(_gsSqueakTemp_whole := _gsSqueakTemp_lits
							detect: [:each | (each keywords
									detect: [:frag | frag = string]
									ifNone: [])
									~~ nil]
							ifNone: []) ~~ nil
				ifFalse: [string = 'primitive:'
						ifTrue: [^ self explainChar: '<']
						ifFalse: [^ nil]].
			_gsSqueakTemp_reply := '.'.
			_gsSqueakTemp_s := '.  To see the definitions, go to the message list pane, get the menu from the top of the scroll bar, and select ''implementors of...''."'].
	_gsSqueakTemp_classes := self systemNavigation allClassesImplementing: _gsSqueakTemp_whole.
	_gsSqueakTemp_classes size > 12
		ifTrue: [_gsSqueakTemp_classes := 'many classes']
		ifFalse: [_gsSqueakTemp_classes := 'these classes ' , _gsSqueakTemp_classes printString].
	^ '"' , string , ' is one part of the message selector ' , _gsSqueakTemp_whole , _gsSqueakTemp_reply , '  It is defined in ' , _gsSqueakTemp_classes , _gsSqueakTemp_s