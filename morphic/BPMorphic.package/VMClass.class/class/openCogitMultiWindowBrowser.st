utilities
openCogitMultiWindowBrowser
	"Answer a new multi-window browser on the ObjectMemory classes,
	the Cog Interpreter classes, and the main JIT classes"
	"self openCogitMultiWindowBrowser"
	| _gsSqueakTemp_b |
	_gsSqueakTemp_b := Browser open.
	Cogit withAllSubclasses , CogObjectRepresentation withAllSubclasses , {CogMethodZone. CogRTLOpcodes}
		, (CogAbstractInstruction withAllSubclasses
				reject: [:c | c name endsWith: 'Tests']) , CogBytecodeFixup withAllSubclasses , CogSimStackEntry withAllSubclasses , {VMStructType. VMMaker. CCodeGenerator. TMethod}
		do: [:class | _gsSqueakTemp_b selectCategoryForClass: class;
				 selectClass: class]
		separatedBy: [_gsSqueakTemp_b multiWindowState addNewWindow].
	_gsSqueakTemp_b multiWindowState selectWindowIndex: 1