toolbuilder
buildNotifierWith: builder label: label message: messageString
	| windowSpec listSpec textSpec panelSpec quads |
	windowSpec := builder pluggableWindowSpec new
		model: self;
		extent: self initialExtentForNotifier;
		label: label;
		children: OrderedCollection new.

	panelSpec := builder pluggablePanelSpec new.
	panelSpec children: OrderedCollection new.
	quads := self preDebugButtonQuads.
	(self interruptedContext selector == #doesNotUnderstand:) ifTrue: [
		quads := quads copyWith: 
			{ 'Create'. #createMethod. #magenta. 'create the missing method' }
	].
	(#(#notYetImplemented #shouldBeImplemented #requirement) includes: self interruptedContext selector) ifTrue: [
		quads := quads copyWith: 
			{ 'Create'. #createImplementingMethod. #magenta. 'implement the marked method' }
	].
	(self interruptedContext selector == #subclassResponsibility) ifTrue: [
		quads := quads copyWith: 
			{ 'Create'. #createOverridingMethod. #magenta. 'create the missing overriding method' }
	].
	quads do:[:spec| | buttonSpec |
		buttonSpec := builder pluggableButtonSpec new.
		buttonSpec model: self.
		buttonSpec label: spec first.
		buttonSpec action: spec second.
		buttonSpec help: spec fourth.
		panelSpec children add: buttonSpec.
	].
	panelSpec layout: #horizontal. "buttons"
	panelSpec frame: self preDebugButtonQuadFrame.
	windowSpec children add: panelSpec.

	Preferences eToyFriendly | messageString notNil ifFalse:[
		listSpec := builder pluggableListSpec new.
		listSpec 
			model: self;
			list: #contextStackList; 
			getIndex: #contextStackIndex; 
			setIndex: #debugAt:; 
			icon: #messageIconAt:;
			help: #messageHelpAt:; 
			frame: self contextStackFrame.
		windowSpec children add: listSpec.
	] ifTrue:[
		message := messageString.
		textSpec := builder pluggableTextSpec new.
		textSpec 
			model: self;
			getText: #preDebugMessageString; 
			setText: nil; 
			selection: nil; 
			menu: #debugProceedMenu:;
			frame: self contextStackFrame.
		windowSpec children add: textSpec.
	].

	^windowSpec