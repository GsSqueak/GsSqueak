utilities
assignCollapseFrameFor: aSSView
  "Offer up a location along the left edge of the screen for a collapsed
	SSView. Make sure it doesn't overlap any other collapsed frames."

  | _gsSqueakTemp_grid _gsSqueakTemp_otherFrames _gsSqueakTemp_topLeft _gsSqueakTemp_viewBox _gsSqueakTemp_collapsedFrame _gsSqueakTemp_extent _gsSqueakTemp_newFrame _gsSqueakTemp_verticalBorderDistance _gsSqueakTemp_top |
  _gsSqueakTemp_grid := 8.
  _gsSqueakTemp_verticalBorderDistance := 8.
  aSSView isMorph
    ifTrue: [ 
      _gsSqueakTemp_otherFrames := (SystemWindow
        windowsIn: aSSView world
        satisfying: [ :w | w ~= aSSView ])
        collect: [ :w | w collapsedFrame ]
        thenSelect: [ :rect | rect notNil ].
      _gsSqueakTemp_viewBox := self maximumUsableAreaInWorld: aSSView world ]
    ifFalse: [ 
      _gsSqueakTemp_otherFrames := nil scheduledWindowControllers
        collect: [ :aController | 
          aController view ~= aSSView
            ifTrue: [ aController view collapsedFrame ] ]
        thenSelect: [ :rect | rect notNil ].
      _gsSqueakTemp_viewBox := Display boundingBox ].
  _gsSqueakTemp_collapsedFrame := aSSView collapsedFrame.
  _gsSqueakTemp_extent := _gsSqueakTemp_collapsedFrame notNil
    ifTrue: [ _gsSqueakTemp_collapsedFrame extent ]
    ifFalse: [ 
      aSSView isMorph
        ifTrue: [ 
          (aSSView getRawLabel width + aSSView labelWidgetAllowance)
            @ (aSSView labelHeight + 2) ]
        ifFalse: [ 
          (aSSView labelText extent x + 70) @ aSSView labelHeight
            min: aSSView labelDisplayBox extent ] ].
  _gsSqueakTemp_collapsedFrame notNil
    ifTrue: [ 
      (_gsSqueakTemp_otherFrames
        anySatisfy: [ :f | _gsSqueakTemp_collapsedFrame intersects: f ])
        ifFalse: [ 
          "non overlapping"
          ^ _gsSqueakTemp_collapsedFrame ] ].
  _gsSqueakTemp_top := _gsSqueakTemp_viewBox top
    + _gsSqueakTemp_verticalBorderDistance.
  [ 
  _gsSqueakTemp_topLeft := _gsSqueakTemp_viewBox left @ _gsSqueakTemp_top.
  _gsSqueakTemp_newFrame := _gsSqueakTemp_topLeft extent: _gsSqueakTemp_extent.
  _gsSqueakTemp_newFrame bottom
    <= (_gsSqueakTemp_viewBox height - _gsSqueakTemp_verticalBorderDistance) ]
    whileTrue: [ 
      (_gsSqueakTemp_otherFrames
        anySatisfy: [ :w | _gsSqueakTemp_newFrame intersects: w ])
        ifFalse: [ 
          "no overlap"
          ^ _gsSqueakTemp_newFrame ].
      _gsSqueakTemp_top := _gsSqueakTemp_top + _gsSqueakTemp_grid ].	"If all else fails... (really to many wins here)"
  aSSView isMorph
    ifTrue: [ 
      Project current showWorldMainDockingBar
        ifTrue: [ 
          ^ 0 @ Project current world mainDockingBars first height
            extent: _gsSqueakTemp_extent ] ].
  ^ 0 @ 0 extent: _gsSqueakTemp_extent