misc
offerAlternateViewerMenuFor: aViewer event: evt 
	"Put up an alternate Viewer menu on behalf of the receiver."
	| _gsSqueakTemp_aMenu _gsSqueakTemp_aWorld |
	_gsSqueakTemp_aWorld := aViewer world.
	_gsSqueakTemp_aMenu := MenuMorph new defaultTarget: self.
	costumes
		ifNotNil: [(costumes size > 1
					or: [costumes size = 1
							and: [costumes first ~~ costume renderedMorph]])
				ifTrue: [_gsSqueakTemp_aMenu
						add: 'forget other costumes' translated
						target: self
						selector: #forgetOtherCostumes]].
	_gsSqueakTemp_aMenu
		add: 'expunge empty scripts' translated
		target: self
		action: #expungeEmptyScripts.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu
		add: 'choose vocabulary...' translated
		target: aViewer
		action: #chooseVocabulary.
	_gsSqueakTemp_aMenu balloonTextForLastItem: 'Choose a different vocabulary for this Viewer.' translated.
	_gsSqueakTemp_aMenu
		add: 'choose limit class...' translated
		target: aViewer
		action: #chooseLimitClass.
	_gsSqueakTemp_aMenu balloonTextForLastItem: 'Specify what the limitClass should be for this Viewer -- i.e., the most generic class whose methods and categories should be considered here.' translated.
	_gsSqueakTemp_aMenu
		add: 'open standard lexicon' translated
		target: aViewer
		action: #openLexicon.
	_gsSqueakTemp_aMenu balloonTextForLastItem: 'open a window that shows the code for this object in traditional programmer format' translated.
	_gsSqueakTemp_aMenu
		add: 'open lexicon with search pane' translated
		target: aViewer
		action: #openSearchingProtocolBrowser.
	_gsSqueakTemp_aMenu balloonTextForLastItem: 'open a lexicon that has a type-in pane for search (not recommended!)' translated.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu
		add: 'inspect morph' translated
		target: costume
		selector: #inspect.
	_gsSqueakTemp_aMenu
		add: 'inspect player' translated
		target: self
		selector: #inspect.
	self belongsToUniClass
		ifTrue: [_gsSqueakTemp_aMenu
				add: 'browse class' translated
				target: self
				action: #browsePlayerClass.
			_gsSqueakTemp_aMenu
				add: 'inspect class' translated
				target: self class
				action: #inspect].
	_gsSqueakTemp_aMenu
		add: 'inspect this Viewer' translated
		target: aViewer
		selector: #inspect.
	_gsSqueakTemp_aMenu
		add: 'inspect this Vocabulary' translated
		target: aViewer currentVocabulary
		selector: #inspect.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu
		add: 'relaunch this Viewer' translated
		target: aViewer
		action: #relaunchViewer.
	_gsSqueakTemp_aMenu
		add: 'attempt repairs' translated
		target: (Smalltalk at: #'ActiveWorld')
		action: #attemptCleanup.
	_gsSqueakTemp_aMenu
		add: 'view morph directly' translated
		target: aViewer
		action: #viewMorphDirectly.
	_gsSqueakTemp_aMenu balloonTextForLastItem: 'opens a Viewer directly on the rendered morph.' translated.
	costume renderedMorph isSketchMorph
		ifTrue: [_gsSqueakTemp_aMenu addLine.
			_gsSqueakTemp_aMenu
				add: 'impart scripts to...' translated
				target: self
				action: #impartSketchScripts].
	_gsSqueakTemp_aMenu popUpEvent: evt in: _gsSqueakTemp_aWorld