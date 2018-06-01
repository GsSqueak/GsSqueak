class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#JoystickMorph. #authoringPrototype. 'Joystick' translatedNoop. 'A joystick-like control' translatedNoop} 
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#JoystickMorph	. #authoringPrototype. 'Joystick' translatedNoop. 'A joystick-like control' translatedNoop} 
						forFlapNamed: 'Scripting'.
						cl registerQuad: {#JoystickMorph	. #authoringPrototype. 'Joystick' translatedNoop. 'A joystick-like control' translatedNoop}
						forFlapNamed: 'Supplies']