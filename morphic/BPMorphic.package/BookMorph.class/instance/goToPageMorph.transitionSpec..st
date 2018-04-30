navigation
goToPageMorph: newPage transitionSpec: transitionSpec
  "Go to a page, which is assumed to be an element of my pages array
	(if it is not, this method returns quickly. Apply the transitionSpec
	provided. "

  | _gsSqueakTemp_pageIndex _gsSqueakTemp_aWorld _gsSqueakTemp_oldPageIndex _gsSqueakTemp_ascending _gsSqueakTemp_tSpec _gsSqueakTemp_readIn |
  pages isEmpty
    ifTrue: [ ^ self	"In the process of a prior pageTurn" ].
  self setProperty: #'searchContainer' toValue: nil.	"forget previous search"
  self setProperty: #'searchOffset' toValue: nil.
  self setProperty: #'searchKey' toValue: nil.
  _gsSqueakTemp_pageIndex := pages
    identityIndexOf: newPage
    ifAbsent: [ ^ self	"In the process of a prior pageTurn" ].
  _gsSqueakTemp_readIn := newPage isInMemory not.
  _gsSqueakTemp_oldPageIndex := pages
    identityIndexOf: currentPage
    ifAbsent: [  ].
  _gsSqueakTemp_ascending := (_gsSqueakTemp_oldPageIndex isNil
    or: [ newPage == currentPage ])
    ifFalse: [ _gsSqueakTemp_oldPageIndex < _gsSqueakTemp_pageIndex ].
  _gsSqueakTemp_tSpec := transitionSpec
    ifNil: [ 
      "If transition not specified by requestor..."
      newPage
        valueOfProperty: #'transitionSpec'
        ifAbsent: [ 
          "... then consult new page"
          self transitionSpecFor: self	"... otherwise this is the default" ] ].
  self flag: #'arNote'.	"Probably unnecessary"
  (_gsSqueakTemp_aWorld := self world)
    ifNotNil: [ self primaryHand releaseKeyboardFocus ].
  currentPage ifNotNil: [ currentPage updateCachedThumbnail ].
  self currentPage notNil
    ifTrue: [ 
      (((pages at: _gsSqueakTemp_pageIndex) owner isKindOf: TransitionMorph)
        and: [ (pages at: _gsSqueakTemp_pageIndex) isInWorld ])
        ifTrue: [ ^ self	"In the process of a prior pageTurn" ].
      self currentPlayerDo: [ :aPlayer | aPlayer runAllClosingScripts ].
      _gsSqueakTemp_ascending
        ifNotNil: [ 
          "Show appropriate page transition and start new page
					when done"
          currentPage stopStepping.
          (pages at: _gsSqueakTemp_pageIndex) position: currentPage position.
          ^ (TransitionMorph
            effect: _gsSqueakTemp_tSpec second
            direction: _gsSqueakTemp_tSpec third
            inverse: (_gsSqueakTemp_ascending or: [ transitionSpec notNil ]) not)
            showTransitionFrom: currentPage
            to: (pages at: _gsSqueakTemp_pageIndex)
            in: self
            whenStart: [ self playPageFlipSound: _gsSqueakTemp_tSpec first ]
            whenDone: [ 
              currentPage
                delete;
                fullReleaseCachedState.
              self
                insertPageMorphInCorrectSpot:
                  (pages at: _gsSqueakTemp_pageIndex).
              self adjustCurrentPageForFullScreen.
              self snapToEdgeIfAppropriate.
              _gsSqueakTemp_aWorld
                ifNotNil: [ self world startSteppingSubmorphsOf: currentPage ].
              self currentPlayerDo: [ :aPlayer | aPlayer runAllOpeningScripts ].
              (_gsSqueakTemp_aWorld := self world)
                ifNotNil: [ 
                  "WHY??"
                  _gsSqueakTemp_aWorld displayWorld ].
              _gsSqueakTemp_readIn
                ifTrue: [ 
                  currentPage updateThumbnailUrlInBook: self url.
                  currentPage sqkPage computeThumbnail	"just store it" ] ] ].	"No transition, but at least decommission current page"
      currentPage
        delete;
        fullReleaseCachedState ].
  self insertPageMorphInCorrectSpot: (pages at: _gsSqueakTemp_pageIndex).	"sets currentPage"
  self adjustCurrentPageForFullScreen.
  self snapToEdgeIfAppropriate.
  _gsSqueakTemp_aWorld
    ifNotNil: [ self world startSteppingSubmorphsOf: currentPage ].
  self currentPlayerDo: [ :aPlayer | aPlayer runAllOpeningScripts ].
  (_gsSqueakTemp_aWorld := self world)
    ifNotNil: [ 
      "WHY??"
      _gsSqueakTemp_aWorld displayWorld ].
  _gsSqueakTemp_readIn
    ifTrue: [ 
      currentPage updateThumbnailUrl.
      currentPage sqkPage computeThumbnail	"just store it" ]