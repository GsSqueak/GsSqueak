class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#PaintInvokingMorph. #new	. 'Paint' translatedNoop. 'Drop this into an area to start making a fresh painting there' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#PaintInvokingMorph. #new. 'Paint' translatedNoop. 'Drop this into an area to start making a fresh painting there' translatedNoop}
						forFlapNamed: 'Widgets'.
						cl registerQuad: {#PaintInvokingMorph. #new. 'Paint' translatedNoop. 'Drop this into an area to start making a fresh painting there' translatedNoop}
						forFlapNamed: 'Scripting']