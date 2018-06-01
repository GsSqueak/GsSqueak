initialization
initializeFor: aTarget fromDictionary: aDictionary 
	"Initialize me for a target and a dictionary."

	| anIndex aButton |
	self baseDictionary: aDictionary.
	target := aTarget.
	coexistWithOriginal := true.
	self extent: 210 @ 210.
	self clipSubmorphs: true.
	self layoutPolicy: ProportionalLayout new.
	aButton := (IconicButton new)
				borderWidth: 0;
				labelGraphic: (ScriptingSystem formAtKey: 'TinyMenu');
				color: Color transparent;
				actWhen: #buttonDown;
				actionSelector: #showMenu;
				target: self;
				setBalloonText: 'menu'.
	self addMorph: aButton
		fullFrame: (LayoutFrame fractions: (0.5 @ 0 extent: 0 @ 0)
				offsets: (-50 @ 6 extent: aButton extent)).
	aButton := (SimpleButtonMorph new)
				target: self;
				borderColor: Color black;
				label: 'Prev';
				actionSelector: #downArrowHit;
				actWhen: #whilePressed;
				setBalloonText: 'show previous picture';
				yourself.
	self addMorph: aButton
		fullFrame: (LayoutFrame fractions: (0.5 @ 0 extent: 0 @ 0)
				offsets: (-24 @ 4 extent: aButton extent)).
	aButton := (SimpleButtonMorph new)
				target: self;
				borderColor: Color black;
				label: 'Next';
				actionSelector: #upArrowHit;
				actWhen: #whilePressed;
				setBalloonText: 'show next pictutre'.
	self addMorph: aButton
		fullFrame: (LayoutFrame fractions: (0.5 @ 0 extent: 0 @ 0)
				offsets: (24 @ 4 extent: aButton extent)).
	self addMorph: ((UpdatingStringMorph new)
				contents: ' ';
				target: self;
				putSelector: #renameGraphicTo:;
				getSelector: #truncatedNameOfGraphic;
				useStringFormat;
				setBalloonText: 'The name of the current graphic';
				yourself)
		fullFrame: (LayoutFrame fractions: (0 @ 0 extent: 1 @ 0)
				offsets: (10 @ 40 corner: -10 @ 60)).
	self addMorph: ((Morph new)
				extent: 100 @ 4;
				color: Color black)
		fullFrame: (LayoutFrame fractions: (0 @ 0 extent: 1 @ 0)
				offsets: (0 @ 60 corner: 0 @ 64)).
	formDisplayMorph := (Thumbnail new)
				extent: 100 @ 100;
				useInterpolation: true;
				maxWidth: 3000 minHeight: 100;
				yourself.
	formDisplayMorph layoutFrame: 
		(LayoutFrame fractions: (0 @ 0 extent: 0@0)
				offsets: (8 @ 72 corner:  108 @ 172)).				
	self addMorph: formDisplayMorph.
	self minimumExtent: 116@180.
	target ifNotNil: 
			[(anIndex := formChoices indexOf: target form ifAbsent: []) 
				ifNotNil: [currentIndex := anIndex]].
	self updateThumbnail