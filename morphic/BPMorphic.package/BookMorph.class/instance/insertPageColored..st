insert and delete
insertPageColored: aColor
  "Insert a new page for the receiver, using the given color as its
	background color"

  | _gsSqueakTemp_pageExtent _gsSqueakTemp_newPage _gsSqueakTemp_borderWidth _gsSqueakTemp_backgroundColor |
  _gsSqueakTemp_backgroundColor := currentPage isNil
    ifTrue: [ 
      _gsSqueakTemp_pageExtent := pageSize.
      _gsSqueakTemp_borderWidth := 0.
      Color blue muchLighter ]
    ifFalse: [ 
      _gsSqueakTemp_pageExtent := currentPage extent.
      _gsSqueakTemp_borderWidth := currentPage borderWidth.
      currentPage borderColor ].
  newPagePrototype
    ifNil: [ 
      _gsSqueakTemp_newPage := PasteUpMorph new
        extent: _gsSqueakTemp_pageExtent;
        color: aColor.
      _gsSqueakTemp_newPage
        borderWidth: _gsSqueakTemp_borderWidth;
        borderColor: _gsSqueakTemp_backgroundColor ]
    ifNotNil: [ 
      _gsSqueakTemp_newPage := Cursor wait
        showWhile: [ newPagePrototype veryDeepCopy ] ].
  _gsSqueakTemp_newPage setNameTo: self defaultNameStemForNewPages.
  _gsSqueakTemp_newPage vResizeToFit: false.
  self pages isEmpty
    ifTrue: [ self pages add: (currentPage := _gsSqueakTemp_newPage) ]
    ifFalse: [ self pages add: _gsSqueakTemp_newPage after: currentPage ].
  self nextPage