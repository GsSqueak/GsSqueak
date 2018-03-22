misc
grabPlayerIn: aWorld
  "Invoked from a Viewer: rip my morph out of its container, wherever
	that may be, and place it in the hand, being careful to set things up
	so that if the subsequent drop is rejected, the morph will end up in a
	visible location on the screen"

  | _gsSqueakTemp_aMorph _gsSqueakTemp_newPosition |
  self costume == aWorld
    ifTrue: [ ^ self ].
  (SessionTemps current at: #'ActiveHand') releaseMouseFocus.
  (_gsSqueakTemp_aMorph := self costume) visible: true.
  _gsSqueakTemp_newPosition := (SessionTemps current at: #'ActiveHand') position
    - (_gsSqueakTemp_aMorph extent // 2).
  _gsSqueakTemp_aMorph isInWorld
    ifTrue: [ 
      _gsSqueakTemp_aMorph goHome.
      _gsSqueakTemp_aMorph formerPosition: _gsSqueakTemp_aMorph positionInWorld ]
    ifFalse: [ _gsSqueakTemp_aMorph formerPosition: aWorld center ].
  _gsSqueakTemp_aMorph formerOwner: (SessionTemps current at: #'ActiveWorld').
  _gsSqueakTemp_aMorph position: _gsSqueakTemp_newPosition.
  (SessionTemps current at: #'ActiveHand')
    targetOffset:
      _gsSqueakTemp_aMorph position
        - (SessionTemps current at: #'ActiveHand') position.
  (SessionTemps current at: #'ActiveHand') addMorphBack: _gsSqueakTemp_aMorph