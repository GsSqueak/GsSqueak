insert and delete
insertPage: aPage pageSize: aPageSize atIndex: anIndex
  | _gsSqueakTemp_sz _gsSqueakTemp_predecessor |
  _gsSqueakTemp_sz := aPageSize
    ifNil: [ 
      currentPage isNil
        ifTrue: [ pageSize ]
        ifFalse: [ currentPage extent ] ]
    ifNotNil: [ aPageSize ].
  aPage extent: _gsSqueakTemp_sz.
  (self pages isEmpty | anIndex isNil or: [ anIndex > self pages size ])
    ifTrue: [ pages add: aPage ]
    ifFalse: [ 
      anIndex <= 1
        ifTrue: [ pages addFirst: aPage ]
        ifFalse: [ 
          _gsSqueakTemp_predecessor := anIndex isNil
            ifTrue: [ currentPage ]
            ifFalse: [ pages at: anIndex ].
          self pages add: aPage after: _gsSqueakTemp_predecessor ] ].
  self goToPageMorph: aPage