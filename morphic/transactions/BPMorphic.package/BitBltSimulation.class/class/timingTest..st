testing
timingTest: extent 
	"BitBltSimulation timingTest: 640@480"
	| _gsSqueakTemp_f _gsSqueakTemp_f2 _gsSqueakTemp_map |
	_gsSqueakTemp_f := Form extent: extent depth: 8.
	_gsSqueakTemp_f2 := Form extent: extent depth: 8.
	_gsSqueakTemp_map := Bitmap new: 1 << _gsSqueakTemp_f2 depth.
	^ Array
		with: (Time
				millisecondsToRun: [100
						timesRepeat: [_gsSqueakTemp_f fillWithColor: Color white]])
		with: (Time
				millisecondsToRun: [100
						timesRepeat: [_gsSqueakTemp_f
								copy: _gsSqueakTemp_f boundingBox
								from: 0 @ 0
								in: _gsSqueakTemp_f2
								rule: Form over]])
		with: (Time
				millisecondsToRun: [100
						timesRepeat: [_gsSqueakTemp_f
								copyBits: _gsSqueakTemp_f boundingBox
								from: _gsSqueakTemp_f2
								at: 0 @ 0
								colorMap: _gsSqueakTemp_map]])