testing
test
	"
	LRUCache test 
	"
	| _gsSqueakTemp_c |
	_gsSqueakTemp_c := LRUCache
				size: 5
				factory: [:key | key * 2].
	_gsSqueakTemp_c at: 1.
	_gsSqueakTemp_c at: 2.
	_gsSqueakTemp_c at: 3.
	_gsSqueakTemp_c at: 4.
	_gsSqueakTemp_c at: 1.
	_gsSqueakTemp_c at: 5.
	_gsSqueakTemp_c at: 6.
	_gsSqueakTemp_c at: 7.
	_gsSqueakTemp_c at: 8.
	_gsSqueakTemp_c at: 1.
	^ _gsSqueakTemp_c