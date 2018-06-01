testing
isEdge: edge 
	| _gsSqueakTemp_type |
	_gsSqueakTemp_type := self objectTypeOf: edge.
	_gsSqueakTemp_type > GEPrimitiveEdgeMask
		ifTrue: [^ false].
	^ ((self objectTypeOf: edge)
		bitAnd: GEPrimitiveEdgeMask)
		~= 0