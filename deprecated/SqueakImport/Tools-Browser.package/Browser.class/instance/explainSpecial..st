class functions
explainSpecial: string 
	"Answer a string explaining the code pane selection if it is displaying 
	one of the special edit functions."

	| classes whole lits reply |
	(editSelection == #editClass or: [editSelection == #newClass])
		ifTrue: 
			["Selector parts in class definition"
			string last == $: ifFalse: [^nil].
			lits := Array with:
				#subclass:instanceVariableNames:classVariableNames:poolDictionaries:category:.
			(whole := lits
					detect: [:each | each keywords anySatisfy: [:frag | frag = string] ]
					ifNone: []) ~~ nil
				ifTrue: [reply := '"' , string , ' is one part of the message selector ' , whole , '.']
				ifFalse: [^nil].
			classes := self systemNavigation allClassesImplementing: whole.
			classes := 'these classes ' , classes printString.
			^reply , '  It is defined in ' , classes , '."
Smalltalk browseAllImplementorsOf: #' , whole].

	editSelection == #hierarchy
		ifTrue: 
			["Instance variables in subclasses"
			classes := self selectedClassOrMetaClass allSubclasses.
			classes := classes
					detect: [:each | each instVarNames anySatisfy: [:name | name = string] ]
					ifNone: [^nil].
			classes := classes printString.
			^'"is an instance variable in class ' , classes , '."
' , classes , ' browseAllAccessesTo: ''' , string , '''.'].
	editSelection == #editSystemCategories ifTrue: [^nil].
	editSelection == #editMessageCategories ifTrue: [^nil].
	^nil