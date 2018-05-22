menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add custom items to the menu"

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu addLine.
	aCustomMenu add: 'set X range' translated action: #setXRange.
	aCustomMenu add: 'set Y range' translated action: #setYRange.
	aCustomMenu addLine.
	aCustomMenu addUpdating: #autoCenterString target: self action: #toggleAutoCenter.
	aCustomMenu balloonTextForLastItem: 'When auto-center is on, every time you let go of the Joystick knob, it springs back to the neutral position at the center of the device' translated. 
	aCustomMenu addUpdating: #realJoystickString target: self action: #toggleRealJoystick.
	aCustomMenu balloonTextForLastItem: 'Governs whether this joystick should track the motions of a real, physical joystick attached to the computer.' translated. 
	aCustomMenu addUpdating: #joystickNumberString enablementSelector: #realJoystickInUse target: self selector: #chooseJoystickNumber argumentList: #().
	aCustomMenu balloonTextForLastItem: 'Choose which physical device is associated with the joystick.' translated