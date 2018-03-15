explain
explainGlobal: symbol 
	"Is symbol a global variable?"
	| _gsSqueakTemp_reply _gsSqueakTemp_classes |
	_gsSqueakTemp_reply := Smalltalk
				at: symbol
				ifAbsent: [^ nil].
	(_gsSqueakTemp_reply class == Dictionary
			or: [_gsSqueakTemp_reply isKindOf: SharedPool class])
		ifTrue: [_gsSqueakTemp_classes := Set new.
			self systemNavigation
				allBehaviorsDo: [:each | (each sharedPools
							anySatisfy: [:pool | pool == _gsSqueakTemp_reply])
						ifTrue: [_gsSqueakTemp_classes add: each]].
			_gsSqueakTemp_classes := _gsSqueakTemp_classes printString.
			^ '"is a global variable.  It is a pool which is used by the following classes '
				, (_gsSqueakTemp_classes allButFirst: 5) , '"'].
	(_gsSqueakTemp_reply isKindOf: Behavior)
		ifTrue: [^ '"is a global variable.  ' , symbol , ' is a class in category ' , _gsSqueakTemp_reply category , '."' , '\' withCRs , 'Browser newOnClass: ' , symbol , '.'].
	symbol == #Smalltalk
		ifTrue: [^ '"is a global.  Smalltalk is the only instance of SystemDictionary and holds all global variables."'].
	^ '"is a global variable.  ' , symbol , ' is ' , _gsSqueakTemp_reply printString , '"'