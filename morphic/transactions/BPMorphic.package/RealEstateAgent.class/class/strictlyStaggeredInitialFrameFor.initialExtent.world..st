framing - private
strictlyStaggeredInitialFrameFor: aStandardSystemView initialExtent: initialExtent world: aWorld
  "This method implements a staggered window placement policy that I
	(di) like.
	Basically it provides for up to 4 windows, staggered from each of the
	4 corners.
	The windows are staggered so that there will always be a corner
	visible. "

  | _gsSqueakTemp_allowedArea _gsSqueakTemp_grid _gsSqueakTemp_initialFrame _gsSqueakTemp_otherFrames _gsSqueakTemp_cornerSel _gsSqueakTemp_corner _gsSqueakTemp_delta _gsSqueakTemp_putativeCorner _gsSqueakTemp_free _gsSqueakTemp_maxLevel |
  _gsSqueakTemp_allowedArea := (self maximumUsableAreaInWorld: aWorld)
    insetBy: (self scrollBarSetback @ self screenTopSetback extent: 0 @ 0).	"Number to be staggered at each corner (less on small screens)"
  _gsSqueakTemp_maxLevel := _gsSqueakTemp_allowedArea area > 300000
    ifTrue: [ 3 ]
    ifFalse: [ 2 ].	"Amount by which to stagger (less on small screens)"
  _gsSqueakTemp_grid := _gsSqueakTemp_allowedArea area > 500000
    ifTrue: [ 40 ]
    ifFalse: [ 20 ].
  _gsSqueakTemp_initialFrame := 0 @ 0 extent: initialExtent.	"min: (allowedArea extent - (grid*(maxLevel+1*2) + (grid//2))))
	min: 600@400"
  _gsSqueakTemp_otherFrames := true
    ifTrue: [ 
      (SystemWindow windowsIn: aWorld satisfying: [ :w | w isCollapsed not ])
        collect: [ :w | w bounds ] ]
    ifFalse: [ 
      nil scheduledWindowControllers
        select: [ :aController | aController view ~~ nil ]
        thenCollect: [ :aController | 
          aController view isCollapsed
            ifTrue: [ aController view expandedFrame ]
            ifFalse: [ aController view displayBox ] ] ].	"Smalltalk isMorphic"
  0 to: _gsSqueakTemp_maxLevel do: [ :level | 
    1 to: 4 do: [ :ci | 
      _gsSqueakTemp_cornerSel := #(#'topLeft' #'topRight' #'bottomRight' #'bottomLeft')
        at: ci.
      _gsSqueakTemp_corner := _gsSqueakTemp_allowedArea
        perform: _gsSqueakTemp_cornerSel.	"The extra grid//2 in delta helps to keep title tabs
					distinct "
      _gsSqueakTemp_delta := ((_gsSqueakTemp_maxLevel - level)
        * _gsSqueakTemp_grid + (_gsSqueakTemp_grid // 2))
        @ (level * _gsSqueakTemp_grid).
      1 to: ci - 1 do: [ :i | _gsSqueakTemp_delta := _gsSqueakTemp_delta rotateBy: #'right' centerAt: 0 @ 0 ].	"slow way"
      _gsSqueakTemp_putativeCorner := _gsSqueakTemp_corner + _gsSqueakTemp_delta.
      _gsSqueakTemp_free := true.
      _gsSqueakTemp_otherFrames
        do: [ :w | 
          _gsSqueakTemp_free := _gsSqueakTemp_free
            &
              ((w perform: _gsSqueakTemp_cornerSel) ~= _gsSqueakTemp_putativeCorner) ].
      _gsSqueakTemp_free
        ifTrue: [ 
          ^ (_gsSqueakTemp_initialFrame
            align: (_gsSqueakTemp_initialFrame perform: _gsSqueakTemp_cornerSel)
            with: _gsSqueakTemp_putativeCorner)
            translatedAndSquishedToBeWithin: _gsSqueakTemp_allowedArea ] ] ].	"If all else fails..."
  ^ (self scrollBarSetback @ self screenTopSetback
    extent: _gsSqueakTemp_initialFrame extent)
    translatedAndSquishedToBeWithin: _gsSqueakTemp_allowedArea