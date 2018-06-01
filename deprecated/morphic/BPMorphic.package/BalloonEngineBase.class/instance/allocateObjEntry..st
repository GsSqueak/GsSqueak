allocating
allocateObjEntry: nSlots 
	"Allocate n slots in the object buffer"
	| _gsSqueakTemp_srcIndex _gsSqueakTemp_dstIndex |
	"First allocate nSlots in the GET"
	(self allocateGETEntry: nSlots)
		ifFalse: [^ false].
	self getUsedGet = 0
		ifFalse: ["Then move the GET upwards"
			_gsSqueakTemp_srcIndex := self getUsedGet.
			_gsSqueakTemp_dstIndex := self getUsedGet + nSlots.
			1
				to: self getUsedGet
				do: [:i | getBuffer
						at: (_gsSqueakTemp_dstIndex := _gsSqueakTemp_dstIndex - 1)
						put: (getBuffer at: (_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex - 1))]].
	getBuffer := getBuffer + nSlots.
	^ true