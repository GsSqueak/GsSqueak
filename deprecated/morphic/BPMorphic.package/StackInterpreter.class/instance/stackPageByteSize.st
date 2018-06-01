stack pages
stackPageByteSize
	"Answer a page size that is a power-of-two and contains a useful
	number of frames.
	Room for 256 slots for frames gives around 40 frames a page which is
	a good compromise between overflow rate and latency in divorcing a
	page. "
	| _gsSqueakTemp_pageBytes _gsSqueakTemp_largeSize _gsSqueakTemp_smallSize |
	_gsSqueakTemp_pageBytes := self stackPageFrameBytes + self stackLimitOffset + self stackPageHeadroom.
	(_gsSqueakTemp_pageBytes bitAnd: _gsSqueakTemp_pageBytes - 1)
			= 0
		ifTrue: ["= 0 => a power of two"
			^ _gsSqueakTemp_pageBytes].
	"round up or round down; that is the question. If rounding down
	reduces the size by no more than 1/8th round down, otherwise
	roundup. "
	_gsSqueakTemp_largeSize := 1 << _gsSqueakTemp_pageBytes highBit.
	_gsSqueakTemp_smallSize := 1 << (_gsSqueakTemp_pageBytes highBit - 1).
	self
		assert: (_gsSqueakTemp_largeSize > _gsSqueakTemp_pageBytes
				and: [_gsSqueakTemp_pageBytes > _gsSqueakTemp_smallSize]).
	^ _gsSqueakTemp_pageBytes - _gsSqueakTemp_smallSize <= (_gsSqueakTemp_smallSize / 8)
		ifTrue: [_gsSqueakTemp_smallSize]
		ifFalse: [_gsSqueakTemp_largeSize]