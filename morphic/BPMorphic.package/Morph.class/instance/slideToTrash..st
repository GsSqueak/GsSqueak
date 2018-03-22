dropping/grabbing
slideToTrash: evt
  "Perhaps slide the receiver across the screen to a trash can and make
	it disappear into it. In any case, remove the receiver from the screen."

  | aForm trash startPoint endPoint morphToSlide |
  (self renderedMorph == ScrapBook default scrapBook
    or: [ self renderedMorph isKindOf: TrashCanMorph ])
    ifTrue: [ 
      self dismissMorph.
      ^ self ].
  TrashCanMorph slideDismissalsToTrash
    ifTrue: [ 
      morphToSlide := self
        representativeNoTallerThan: 200
        norWiderThan: 200
        thumbnailHeight: 100.
      aForm := morphToSlide imageForm offset: 0 @ 0.
      trash := (SessionTemps current at: #'ActiveWorld')
        findDeepSubmorphThat: [ :aMorph | 
          (aMorph isKindOf: TrashCanMorph)
            and: [ aMorph topRendererOrSelf owner == (SessionTemps current at: #'ActiveWorld') ] ]
        ifAbsent: [ 
          trash := TrashCanMorph new.
          trash
            position:
              (SessionTemps current at: #'ActiveWorld') bottomLeft
                - (0 @ (trash extent y + 26)).
          trash openInWorld.
          trash ].
      endPoint := trash fullBoundsInWorld center.
      startPoint := self topRendererOrSelf fullBoundsInWorld center
        - (aForm extent // 2) ].
  self dismissMorph.
  (SessionTemps current at: #'ActiveWorld') displayWorld.
  TrashCanMorph slideDismissalsToTrash
    ifTrue: [ 
      aForm
        slideFrom: startPoint
        to: endPoint
        nSteps: 12
        delay: 15 ].
  ScrapBook default addToTrash: self