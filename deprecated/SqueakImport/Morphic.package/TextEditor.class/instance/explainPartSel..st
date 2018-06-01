explain
explainPartSel: string 
	"Is this a fragment of a multiple-argument selector sent in this method?"
	| lits whole reply classes s msg |

	(model respondsTo: #selectedMessageName) ifFalse: [^ nil].
	(msg := model selectedMessageName) ifNil: [^ nil].  "not in a message"
	string last == $: ifFalse: [^ nil].
	"Name of this method"
	lits := Array with: msg.
	(whole := lits detect: [:each | each keywords anySatisfy: [:frag | frag = string] ]
				ifNone: []) ~~ nil
		ifTrue: [reply := ', which is the selector of this very method!'.
			s := '.  To see the other definitions, go to the message list pane, get the menu from the top of the scroll bar, and select ''implementors of...''."']
		ifFalse: 
			["Selectors called from this method"
			lits := (model selectedClassOrMetaClass compiledMethodAt:
				msg) messages.
			(whole := lits detect: [:each | (each keywords detect: [:frag | frag = string]
							ifNone: []) ~~ nil]
						ifNone: []) ~~ nil
				ifFalse: [string = 'primitive:'
					ifTrue: [^self explainChar: '<']
					ifFalse: [^nil]].
			reply := '.'.
			s := '.  To see the definitions, go to the message list pane, get the menu from the top of the scroll bar, and select ''implementors of...''."'].
	classes := self systemNavigation allClassesImplementing: whole.
	classes size > 12
		ifTrue: [classes := 'many classes']
		ifFalse: [classes := 'these classes ' , classes printString].
	^ '"' , string , ' is one part of the message selector ' , whole, reply , '  It is defined in ' , classes , s