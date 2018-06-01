translation
patchInterpGCCPPC: fileName 
	"Interpreter patchInterpGCCPPC: 'Squeak copy 1'"
	"This will patch out the unneccesary range check (a compare
	and branch) in the inner interpreter dispatch loop. for the PPC version
	of the GCC compiled
	version of Squeak under MPW"
	"NOTE: You must edit in the Interpeter file name"
	| _gsSqueakTemp_delta _gsSqueakTemp_f _gsSqueakTemp_code _gsSqueakTemp_len _gsSqueakTemp_remnant _gsSqueakTemp_i |
	_gsSqueakTemp_delta := 7.
	_gsSqueakTemp_f := FileStream fileNamed: fileName.
	_gsSqueakTemp_f binary.
	_gsSqueakTemp_code := Bitmap new: (_gsSqueakTemp_len := _gsSqueakTemp_f size) // 4.
	_gsSqueakTemp_f nextInto: _gsSqueakTemp_code.
	_gsSqueakTemp_remnant := _gsSqueakTemp_f next: _gsSqueakTemp_len - (_gsSqueakTemp_code size * 4).
	_gsSqueakTemp_i := 0.
	["Look for a BCTR instruction"
	(_gsSqueakTemp_i := _gsSqueakTemp_code
				indexOf: 1317012512
				startingAt: _gsSqueakTemp_i + 1
				ifAbsent: [0]) > 0]
		whileTrue: ["Look for a CMPLWI cr1,rxx,FF, 7 instrs back"
			((_gsSqueakTemp_code at: _gsSqueakTemp_i - _gsSqueakTemp_delta)
					bitAnd: 4292935679)
					= 679477503
				ifTrue: ["Copy dispatch instrs back over the compare"
					self inform: 'Patching at ' , _gsSqueakTemp_i hex.
					0
						to: _gsSqueakTemp_delta - 2
						do: [:j | _gsSqueakTemp_code
								at: _gsSqueakTemp_i - _gsSqueakTemp_delta + j
								put: (_gsSqueakTemp_code at: _gsSqueakTemp_i - _gsSqueakTemp_delta + j + 2)]]].
	_gsSqueakTemp_f position: 0;
		 nextPutAll: _gsSqueakTemp_code;
		 nextPutAll: _gsSqueakTemp_remnant.
	_gsSqueakTemp_f close