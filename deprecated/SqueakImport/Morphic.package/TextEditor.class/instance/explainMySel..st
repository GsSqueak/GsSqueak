explain
explainMySel: symbol 
	"Is symbol the selector of this method?  Is it sent by this method?  If 
	not, then expalin will call (explainPartSel:) to see if it is a fragment of a 
	selector sent here.  If not, explain will call (explainAnySel:) to catch any 
	selector. "

	| lits classes msg |
	(model respondsTo: #selectedMessageName) ifFalse: [^ nil].
	(msg := model selectedMessageName) ifNil: [^nil].	"not in a message"
	classes := self systemNavigation allClassesImplementing: symbol.
	classes size > 12
		ifTrue: [classes := 'many classes']
		ifFalse: [classes := 'these classes ' , classes printString].
	msg = symbol
		ifTrue: [^ '"' , symbol , ' is the selector of this very method!  It is defined in ',
			classes , '.  To see the other definitions, go to the message list pane, get the menu from the top of the scroll bar, and select ''implementors of...''."']
		ifFalse: 
			[lits := (model selectedClassOrMetaClass compiledMethodAt:
				msg) messages.
			(lits anySatisfy: [:each | each == symbol])
				ifFalse: [^nil].
			^ '"' , symbol , ' is a message selector which is defined in ', classes , '.  To see the definitions, go to the message list pane, get the menu from the top of the scroll bar, and select ''implementors of...''."'].