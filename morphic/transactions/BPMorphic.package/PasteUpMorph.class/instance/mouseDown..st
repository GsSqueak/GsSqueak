event handling
mouseDown: evt
  "Handle a mouse down event."

  | grabbedMorph handHadHalos |
  (Preferences generalizedYellowButtonMenu and: [ evt yellowButtonPressed ])
    ifTrue: [ ^ self yellowButtonActivity: evt shiftPressed ].
  grabbedMorph := self morphToGrab: evt.
  grabbedMorph
    ifNotNil: [ 
      grabbedMorph isSticky
        ifTrue: [ ^ self ].
      self isPartsBin
        ifFalse: [ ^ evt hand grabMorph: grabbedMorph ].
      grabbedMorph := grabbedMorph partRepresented duplicate.
      grabbedMorph restoreSuspendedEventHandler.
      (grabbedMorph fullBounds containsPoint: evt position)
        ifFalse: [ grabbedMorph position: evt position ].	"Note: grabbedMorph is ownerless after duplicate so use
			#grabMorph:from: instead"
      ^ evt hand grabMorph: grabbedMorph from: self ].
  (super handlesMouseDown: evt)
    ifTrue: [ ^ super mouseDown: evt ].
  handHadHalos := evt hand halo notNil.
  evt hand removeHalo.	"shake off halos"
  evt hand releaseKeyboardFocus.	"shake of keyboard foci"
  self submorphs
    select: [ :each | each hasProperty: #'morphHierarchy' ]
    thenDo: [ :each | each delete ].
  Preferences noviceMode
    ifTrue: [ 
      self submorphs
        select: [ :each | (each isKindOf: MenuMorph) and: [ each stayUp not ] ]
        thenDo: [ :each | each delete ] ].
  (evt shiftPressed not
    and: [ self isWorldMorph not and: [ self wantsEasySelection not ] ])
    ifTrue: [ 
      "explicitly ignore the event if we're not the world and we'll not
			select, so that we could be picked up if need be"
      evt wasHandled: false.
      ^ self ].
  (evt shiftPressed or: [ self wantsEasySelection ])
    ifTrue: [ 
      | clickSelector |
      "We'll select on drag, let's decide what to do on click"
      clickSelector := nil.
      evt shiftPressed
        ifTrue: [ clickSelector := #'findWindow:' ]
        ifFalse: [ 
          self isWorldMorph
            ifTrue: [ 
              clickSelector := handHadHalos
                ifTrue: [ #'delayedInvokeWorldMenu:' ]
                ifFalse: [ #'invokeWorldMenu:' ] ] ].
      evt hand
        waitForClicksOrDrag: self
        event: evt
        selectors:
          {clickSelector.
          nil.
          nil.
          #'dragThroughOnDesktop:'}
        threshold: HandMorph dragThreshold ]
    ifFalse: [ 
      "We wont select, just bring world menu if I'm the world"
      " self isWorldMorph
        ifTrue: [ 
          handHadHalos
            ifTrue: [ self delayedInvokeWorldMenu: evt ]
            ifFalse: [ self invokeWorldMenu: evt ] ]	"
      "TODO HACK: dissabled menu"
       ]