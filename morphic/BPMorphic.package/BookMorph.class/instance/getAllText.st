menu
getAllText
  "Collect the text for each page. Just point at strings so don't have to
	recopy them. Parallel array of urls for ID of pages.
	allText = Array (pages size) of arrays (fields in it) of strings of text.
	allTextUrls = Array (pages size) of urls or page numbers.
	For any page that is out, text data came from .bo file on server. 
	Is rewritten when one or all pages are stored."

  | _gsSqueakTemp_oldUrls _gsSqueakTemp_oldStringLists _gsSqueakTemp_allText _gsSqueakTemp_allTextUrls |
  _gsSqueakTemp_oldUrls := self
    valueOfProperty: #'allTextUrls'
    ifAbsent: [ #() ].
  _gsSqueakTemp_oldStringLists := self
    valueOfProperty: #'allText'
    ifAbsent: [ #() ].
  _gsSqueakTemp_allText := self pages collect: [ :pg | OrderedCollection new ].
  _gsSqueakTemp_allTextUrls := Array new: self pages size.
  self pages
    doWithIndex: [ :aPage :ind | 
      | which aUrl |
      aUrl := aPage url.
      aPage isInMemory
        ifTrue: [ 
          (_gsSqueakTemp_allText at: ind) addAll: (aPage allStringsAfter: nil).
          aUrl ifNil: [ aUrl := ind ].
          _gsSqueakTemp_allTextUrls at: ind put: aUrl ]
        ifFalse: [ 
          "Order of pages on server may be different. (later keep
					up to date?)"
          which := _gsSqueakTemp_oldUrls indexOf: aUrl.
          _gsSqueakTemp_allTextUrls at: ind put: aUrl.
          which = 0
            ifFalse: [ _gsSqueakTemp_allText at: ind put: (_gsSqueakTemp_oldStringLists at: which) ] ] ].
  self setProperty: #'allText' toValue: _gsSqueakTemp_allText.
  self setProperty: #'allTextUrls' toValue: _gsSqueakTemp_allTextUrls.
  ^ _gsSqueakTemp_allText