initialization
addRecordingControls
	| button switch playRow durRow articRow modRow |

	"Add chord, rest and delete buttons"
	playRow := AlignmentMorph newRow.
	playRow color: color; borderWidth: 0; layoutInset: 0.
	playRow hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	playRow addMorphBack: (switch label: 'chord' translated; actionSelector: #buildChord:).
	button := SimpleButtonMorph new target: self;
		borderColor: #raised; borderWidth: 2; color: color.
	playRow addMorphBack: (button label: '          rest          ' translated; actionSelector: #emitRest).
	button := SimpleButtonMorph new target: self;
		borderColor: #raised; borderWidth: 2; color: color.
	playRow addMorphBack: (button label: 'del' translated; actionSelector: #deleteNotes).
	self addMorph: playRow.
	playRow align: playRow fullBounds topCenter
			with: self fullBounds bottomCenter.

	"Add note duration buttons"
	durRow := AlignmentMorph newRow.
	durRow color: color; borderWidth: 0; layoutInset: 0.
	durRow hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	durRow addMorphBack: (switch label: 'whole' translated;
				actionSelector: #duration:onOff:; arguments: #(1)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	durRow addMorphBack: (switch label: 'half' translated;
				actionSelector: #duration:onOff:; arguments: #(2)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	durRow addMorphBack: (switch label: 'quarter' translated;
				actionSelector: #duration:onOff:; arguments: #(4)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	durRow addMorphBack: (switch label: 'eighth' translated;
				actionSelector: #duration:onOff:; arguments: #(8)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	durRow addMorphBack: (switch label: 'sixteenth' translated;
				actionSelector: #duration:onOff:; arguments: #(16)).
	self addMorph: durRow.
	durRow align: durRow fullBounds topCenter
			with: playRow fullBounds bottomCenter.

	"Add note duration modifier buttons"
	modRow := AlignmentMorph newRow.
	modRow color: color; borderWidth: 0; layoutInset: 0.
	modRow hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	modRow addMorphBack: (switch label: 'dotted' translated;
				actionSelector: #durMod:onOff:; arguments: #(dotted)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	modRow addMorphBack: (switch label: 'normal' translated;
				actionSelector: #durMod:onOff:; arguments: #(normal)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	modRow addMorphBack: (switch label: 'triplets' translated;
				actionSelector: #durMod:onOff:; arguments: #(triplets)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	modRow addMorphBack: (switch label: 'quints' translated;
				actionSelector: #durMod:onOff:; arguments: #(quints)).
	self addMorph: modRow.
	modRow align: modRow fullBounds topCenter
			with: durRow fullBounds bottomCenter.

	"Add articulation buttons"
	articRow := AlignmentMorph newRow.
	articRow color: color; borderWidth: 0; layoutInset: 0.
	articRow hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	articRow addMorphBack: (switch label: 'legato' translated;
				actionSelector: #articulation:onOff:; arguments: #(legato)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	articRow addMorphBack: (switch label: 'normal' translated;
				actionSelector: #articulation:onOff:; arguments: #(normal)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	articRow addMorphBack: (switch label: 'staccato' translated;
				actionSelector: #articulation:onOff:; arguments: #(staccato)).
	self addMorph: articRow.
	articRow align: articRow fullBounds topCenter
			with: modRow fullBounds bottomCenter.

	self bounds: (self fullBounds expandBy: (0@0 extent: 0@borderWidth))
