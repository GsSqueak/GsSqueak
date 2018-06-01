explain
explainMySel: symbol 
	"Is symbol the selector of this method? Is it sent by this method? If 
	not, then expalin will call (explainPartSel:) to see if it is a fragment of a
	selector sent here. If not, explain will call (explainAnySel:) to catch
	any 
	selector."
	| _gsSqueakTemp_lits _gsSqueakTemp_classes _gsSqueakTemp_msg |
	(model respondsTo: #selectedMessageName)
		ifFalse: [^ nil].
	(_gsSqueakTemp_msg := model selectedMessageName)
		ifNil: [^ nil].
	"not in a message"
	_gsSqueakTemp_classes := self systemNavigation allClassesImplementing: symbol.
	_gsSqueakTemp_classes size > 12
		ifTrue: [_gsSqueakTemp_classes := 'many classes']
		ifFalse: [_gsSqueakTemp_classes := 'these classes ' , _gsSqueakTemp_classes printString].
	_gsSqueakTemp_msg = symbol
		ifTrue: [^ '"' , symbol , ' is the selector of this very method!  It is defined in ' , _gsSqueakTemp_classes , '.  To see the other definitions, go to the message list pane, get the menu from the top of the scroll bar, and select ''implementors of...''."']
		ifFalse: [_gsSqueakTemp_lits := (model selectedClassOrMetaClass compiledMethodAt: _gsSqueakTemp_msg) messages.
			(_gsSqueakTemp_lits
					anySatisfy: [:each | each == symbol])
				ifFalse: [^ nil].
			^ '"' , symbol , ' is a message selector which is defined in ' , _gsSqueakTemp_classes , '.  To see the definitions, go to the message list pane, get the menu from the top of the scroll bar, and select ''implementors of...''."']