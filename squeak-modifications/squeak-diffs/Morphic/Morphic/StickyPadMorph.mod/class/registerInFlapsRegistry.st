as yet unclassified
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#StickyPadMorph.	#newStandAlone.	'Sticky Pad' translatedNoop. 'Each time you obtain one of these pastel, translucent, borderless rectangles, it will be a different color from the previous time.' translatedNoop}
						forFlapNamed: 'Supplies'.
				cl registerQuad: {#StickyPadMorph. #newStandAlone.	'Sticky Pad' translatedNoop.		'Each time you obtain one of these pastel, translucent, borderless rectangles, it will be a different color from the previous time.' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.]