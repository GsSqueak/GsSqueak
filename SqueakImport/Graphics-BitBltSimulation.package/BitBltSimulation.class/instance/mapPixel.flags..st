color mapping
mapPixel: sourcePixel flags: mapperFlags 
	"Color map the given source pixel."
	| _gsSqueakTemp_pv |
	<inline: true>
	_gsSqueakTemp_pv := sourcePixel.
	(mapperFlags bitAnd: ColorMapPresent)
			~= 0
		ifTrue: [(mapperFlags bitAnd: ColorMapFixedPart)
					~= 0
				ifTrue: [_gsSqueakTemp_pv := self rgbMapPixel: sourcePixel flags: mapperFlags.
					"avoid introducing transparency by color reduction"
					(_gsSqueakTemp_pv = 0
							and: [sourcePixel ~= 0])
						ifTrue: [_gsSqueakTemp_pv := 1]].
			(mapperFlags bitAnd: ColorMapIndexedPart)
					~= 0
				ifTrue: [_gsSqueakTemp_pv := cmLookupTable
								at: (_gsSqueakTemp_pv bitAnd: cmMask)]].
	^ _gsSqueakTemp_pv