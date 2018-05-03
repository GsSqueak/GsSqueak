initialization
initializeMiscConstants
	"Falsify the `what type of VM is this?' flags that are defined in the
	various interp.h files.
	Subclass implementations need to include a super
	initializeMiscConstants "
	| _gsSqueakTemp_omc |
	VMBIGENDIAN class.
	"Mention this for the benefit of CCodeGenerator>>emitCConstantsOn:"
	SPURVM := STACKVM := COGVM := COGMTVM := false.
	initializationOptions
		ifNil: [self initializationOptions: Dictionary new].
	_gsSqueakTemp_omc := initializationOptions at: #ObjectMemory ifAbsent: nil.
	(_gsSqueakTemp_omc isNil
			and: [self defaultObjectMemoryClass notNil])
		ifTrue: [_gsSqueakTemp_omc := initializationOptions at: #ObjectMemory put: self defaultObjectMemoryClass name].
	initializationOptions
		at: #SqueakV3ObjectMemory
		ifAbsentPut: (_gsSqueakTemp_omc
				ifNil: ["the good ole default"
					true]
				ifNotNil: [(Smalltalk at: _gsSqueakTemp_omc)
						includesBehavior: ObjectMemory]);
		
		at: #SpurObjectMemory
		ifAbsentPut: (_gsSqueakTemp_omc
				ifNil: ["the new contender"
					false]
				ifNotNil: [(Smalltalk at: _gsSqueakTemp_omc)
						includesBehavior: SpurMemoryManager]).
	"Use ifAbsentPut: so that they will get copied back to the
	VMMaker's options and dead code will likely be eliminated."
	PharoVM := initializationOptions
				at: #PharoVM
				ifAbsentPut: [false].
	NewspeakVM := initializationOptions
				at: #NewspeakVM
				ifAbsentPut: [false].
	SistaVM := initializationOptions
				at: #SistaVM
				ifAbsentPut: [false].
	LowcodeVM := initializationOptions
				at: #LowcodeVM
				ifAbsentPut: [false].
	MULTIPLEBYTECODESETS := initializationOptions
				at: #MULTIPLEBYTECODESETS
				ifAbsentPut: [false].
	"These must be set only if specified, not defaulted, because they are
	set on the command line or in include files."
	initializationOptions
		at: #VMBIGENDIAN
		ifPresent: [:value | VMBIGENDIAN := value];
		
		at: #ObjectMemory
		ifPresent: [:value | SPURVM := value beginsWith: 'Spur'];
		
		at: #STACKVM
		ifPresent: [:value | STACKVM := value];
		
		at: #COGVM
		ifPresent: [:value | COGVM := initializationOptions at: #COGVM];
		
		at: #COGMTVM
		ifPresent: [:value | COGMTVM := initializationOptions at: #COGMTVM].
	"And not these; they're compile-time"
	IMMUTABILITY := initializationOptions
				at: #IMMUTABILITY
				ifAbsent: [SPURVM
					"Default as enabled for Spur VMs"]