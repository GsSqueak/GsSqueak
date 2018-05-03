utilities
openCogMultiWindowBrowser
	"Answer a new multi-window browser on the ObjectMemory classes,
	the Cog Interpreter classes, and the main JIT classes"
	| _gsSqueakTemp_b |
	_gsSqueakTemp_b := Browser open.
	#(#ObjectMemory #NewObjectMemory #NewCoObjectMemory #InterpreterPrimitives #StackInterpreter #StackInterpreterPrimitives #CoInterpreter #CoInterpreterPrimitives #CoInterpreterMT #Cogit #SimpleStackBasedCogit #StackToRegisterMappingCogit #VMStructType #VMMaker #CCodeGenerator #TMethod)
		do: [:className | (Smalltalk classNamed: className)
				ifNotNil: [:class | _gsSqueakTemp_b selectCategoryForClass: class;
						 selectClass: class]]
		separatedBy: [_gsSqueakTemp_b multiWindowState addNewWindow].
	_gsSqueakTemp_b multiWindowState selectWindowIndex: 1