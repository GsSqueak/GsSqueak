slots-user
slotInfoAt: slotName ifAbsent: aBlock 
	"If the receiver has a slot of the given name, answer its slot info, else
	answer nil"
	| _gsSqueakTemp_info |
	_gsSqueakTemp_info := self slotInfo
				at: slotName
				ifAbsent: [^ aBlock value].
	^ _gsSqueakTemp_info