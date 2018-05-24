menu
getStemUrl
  "Try to find the old place where this book was stored. Confirm with the 
	user. Else ask for new place."

  | _gsSqueakTemp_initial _gsSqueakTemp_pg _gsSqueakTemp_url _gsSqueakTemp_knownURL |
  _gsSqueakTemp_knownURL := false.
  _gsSqueakTemp_initial := ''.
  (_gsSqueakTemp_pg := currentPage valueOfProperty: #'SqueakPage')
    ifNotNil: [ 
      _gsSqueakTemp_pg contentsMorph == currentPage
        ifTrue: [ 
          _gsSqueakTemp_initial := _gsSqueakTemp_pg url.
          _gsSqueakTemp_knownURL := true ] ].	"If this page has a url"
  self pages
    doWithIndex: [ :aPage :ind | 
      _gsSqueakTemp_initial isEmpty
        ifTrue: [ 
          aPage isInMemory
            ifTrue: [ 
              (_gsSqueakTemp_pg := aPage valueOfProperty: #'SqueakPage')
                ifNotNil: [ _gsSqueakTemp_initial := _gsSqueakTemp_pg url ] ] ] ].	"any page with a url"
  _gsSqueakTemp_initial isEmpty
    ifTrue: [ _gsSqueakTemp_initial := ServerDirectory defaultStemUrl , '1.sp' ].	"A new legal place"
  _gsSqueakTemp_url := _gsSqueakTemp_knownURL
    ifTrue: [ _gsSqueakTemp_initial ]
    ifFalse: [ 
      UIManager default
        request:
          'url of the place to store a typical page in this book.
Must begin with file:// or ftp://'
            translated
        initialAnswer: _gsSqueakTemp_initial ].
  ^ SqueakPage stemUrl: _gsSqueakTemp_url