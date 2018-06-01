internal interpreter access
getSnapshotScreenSize
	"Answer the screen size to write to the snapshot.
	If the actual screen size is zero then write the savedWindowSize
	instead. "
	| _gsSqueakTemp_screenSize |
	_gsSqueakTemp_screenSize := self ioScreenSize.
	((_gsSqueakTemp_screenSize bitAnd: 65535)
				= 0
			or: [_gsSqueakTemp_screenSize >> 16 = 0])
		ifTrue: [_gsSqueakTemp_screenSize := savedWindowSize].
	^ _gsSqueakTemp_screenSize