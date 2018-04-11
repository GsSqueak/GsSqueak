utilities
assignCollapsePointFor: aSSView
  "Offer up a location along the left edge of the screen for a collapsed
	SSView. Make sure it doesn't overlap any other collapsed frames."

  | _gsSqueakTemp_grid _gsSqueakTemp_otherFrames _gsSqueakTemp_y _gsSqueakTemp_free _gsSqueakTemp_topLeft _gsSqueakTemp_viewBox |
  _gsSqueakTemp_grid := 24.	"should be mult of 8, since manual move is gridded by 8"
  aSSView isMorph
    ifTrue: [ 
      _gsSqueakTemp_otherFrames := (SystemWindow
        windowsIn: aSSView world
        satisfying: [ :w | true ])
        collect: [ :w | w collapsedFrame ]
        thenSelect: [ :rect | rect notNil ].
      _gsSqueakTemp_viewBox := self maximumUsableAreaInWorld: aSSView world ]
    ifFalse: [ 
      _gsSqueakTemp_otherFrames := nil scheduledWindowControllers
        collect: [ :aController | aController view collapsedFrame ]
        thenSelect: [ :rect | rect notNil ].
      _gsSqueakTemp_viewBox := Display boundingBox ].
  _gsSqueakTemp_y := _gsSqueakTemp_viewBox top.
  [ 
  (_gsSqueakTemp_y := _gsSqueakTemp_y + _gsSqueakTemp_grid)
    <= (_gsSqueakTemp_viewBox height - _gsSqueakTemp_grid) ]
    whileTrue: [ 
      _gsSqueakTemp_topLeft := _gsSqueakTemp_viewBox left @ _gsSqueakTemp_y.
      _gsSqueakTemp_free := true.
      _gsSqueakTemp_otherFrames
        do: [ :w | _gsSqueakTemp_free := _gsSqueakTemp_free & (_gsSqueakTemp_topLeft ~= w topLeft) ].
      _gsSqueakTemp_free
        ifTrue: [ ^ _gsSqueakTemp_topLeft ] ].	"If all else fails..."
  ^ 0 @ 0