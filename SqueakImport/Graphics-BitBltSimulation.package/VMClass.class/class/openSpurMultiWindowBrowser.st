utilities
openSpurMultiWindowBrowser
	"Answer a new multi-window browser on the Spur classes, the Cog
	StackInterpreter classes, and the support classes"
	| _gsSqueakTemp_b |
	_gsSqueakTemp_b := Browser open.
	#(#SpurMemoryManager #Spur32BitMemoryManager #Spur64BitMemoryManager #SpurGenerationScavenger #SpurSegmentManager #Spur32BitMMLESimulator #SpurGenerationScavengerSimulator #InterpreterPrimitives #StackInterpreter #StackInterpreterPrimitives #VMStructType #VMMaker #CCodeGenerator #TMethod)
		do: [:className | (Smalltalk classNamed: className)
				ifNotNil: [:class | _gsSqueakTemp_b selectCategoryForClass: class;
						 selectClass: class]]
		separatedBy: [_gsSqueakTemp_b multiWindowState addNewWindow].
	_gsSqueakTemp_b multiWindowState selectWindowIndex: 1