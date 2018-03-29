allocating
allocateGETEntry: nSlots 
	"Allocate n slots in the global edge table"
	| _gsSqueakTemp_srcIndex _gsSqueakTemp_dstIndex |
	"First allocate nSlots in the AET"
	(self allocateAETEntry: nSlots)
		ifFalse: [^ false].
	self aetUsedGet = 0
		ifFalse: ["Then move the AET upwards"
			_gsSqueakTemp_srcIndex := self aetUsedGet.
			_gsSqueakTemp_dstIndex := self aetUsedGet + nSlots.
			1
				to: self aetUsedGet
				do: [:i | aetBuffer
						at: (_gsSqueakTemp_dstIndex := _gsSqueakTemp_dstIndex - 1)
						put: (aetBuffer at: (_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex - 1))]].
	aetBuffer := aetBuffer + nSlots.
	^ true