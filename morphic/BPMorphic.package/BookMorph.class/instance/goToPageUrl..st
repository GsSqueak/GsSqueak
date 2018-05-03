navigation
goToPageUrl: aUrl
  | _gsSqueakTemp_pp _gsSqueakTemp_short |
  _gsSqueakTemp_pp := self pages detect: [ :pg | pg url = aUrl ] ifNone: [  ].
  _gsSqueakTemp_pp
    ifNil: [ 
      _gsSqueakTemp_short := (aUrl findTokens: '/') last.
      _gsSqueakTemp_pp := self pages
        detect: [ :pg | 
          pg url
            ifNil: [ false ]
            ifNotNil: [ (pg url findTokens: '/') last = _gsSqueakTemp_short	"it moved" ] ]
        ifNone: [ self pages first ] ].
  self goToPageMorph: _gsSqueakTemp_pp