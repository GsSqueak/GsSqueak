navigation
goToPage: pageNumber transitionSpec: transitionSpec
  | _gsSqueakTemp_pageMorph |
  self pages isEmpty
    ifTrue: [ ^ self ].
  _gsSqueakTemp_pageMorph := (self hasProperty: #'dontWrapAtEnd')
    ifTrue: [ self pages atPin: pageNumber ]
    ifFalse: [ self pages atWrap: pageNumber ].
  ^ self goToPageMorph: _gsSqueakTemp_pageMorph transitionSpec: transitionSpec