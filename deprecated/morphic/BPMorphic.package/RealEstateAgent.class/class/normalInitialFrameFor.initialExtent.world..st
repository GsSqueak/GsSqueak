framing - private
normalInitialFrameFor: aView initialExtent: initialExtent world: aWorld
  "Find a plausible initial screen area for the supplied view, which should
	be a StandardSystemView, taking into account the
	'reverseWindowStagger' Preference, the size needed, and other
	windows currently on the screen."

  | _gsSqueakTemp_allOrigins _gsSqueakTemp_screenRight _gsSqueakTemp_screenBottom _gsSqueakTemp_putativeOrigin _gsSqueakTemp_putativeFrame _gsSqueakTemp_allowedArea _gsSqueakTemp_staggerOrigin _gsSqueakTemp_otherFrames |
  _gsSqueakTemp_allowedArea := self maximumUsableAreaInWorld: aWorld.
  _gsSqueakTemp_screenRight := _gsSqueakTemp_allowedArea right.
  _gsSqueakTemp_screenBottom := _gsSqueakTemp_allowedArea bottom.
  _gsSqueakTemp_otherFrames := Smalltalk isMorphic
    ifTrue: [ 
      (SystemWindow windowsIn: aWorld satisfying: [ :w | w isCollapsed not ])
        collect: [ :w | w bounds ] ]
    ifFalse: [ 
      nil scheduledWindowControllers
        select: [ :aController | aController view ~~ nil ]
        thenCollect: [ :aController | 
          aController view isCollapsed
            ifTrue: [ aController view expandedFrame ]
            ifFalse: [ aController view displayBox ] ] ].
  _gsSqueakTemp_allOrigins := _gsSqueakTemp_otherFrames
    collect: [ :f | f origin ].
  (self standardPositionsInWorld: aWorld)
    do: [ :aPosition | 
      "First see if one of the standard positions is free"
      (_gsSqueakTemp_allOrigins includes: aPosition)
        ifFalse: [ 
          ^ (aPosition extent: initialExtent)
            translatedAndSquishedToBeWithin: _gsSqueakTemp_allowedArea ] ].
  _gsSqueakTemp_staggerOrigin := (self standardPositionsInWorld: aWorld) first.	"Fallback: try offsetting from top left"
  _gsSqueakTemp_putativeOrigin := _gsSqueakTemp_staggerOrigin.
  [ 
  _gsSqueakTemp_putativeOrigin := _gsSqueakTemp_putativeOrigin + StaggerOffset.
  _gsSqueakTemp_putativeFrame := _gsSqueakTemp_putativeOrigin
    extent: initialExtent.
  _gsSqueakTemp_putativeFrame bottom < _gsSqueakTemp_screenBottom
    and: [ _gsSqueakTemp_putativeFrame right < _gsSqueakTemp_screenRight ] ]
    whileTrue: [ 
      (_gsSqueakTemp_allOrigins includes: _gsSqueakTemp_putativeOrigin)
        ifFalse: [ 
          ^ (_gsSqueakTemp_putativeOrigin extent: initialExtent)
            translatedAndSquishedToBeWithin: _gsSqueakTemp_allowedArea ] ].
  ^ (self scrollBarSetback @ self screenTopSetback extent: initialExtent)
    translatedAndSquishedToBeWithin: _gsSqueakTemp_allowedArea