e-toy support
referencePlayfield
  "Answer the PasteUpMorph to be used for cartesian-coordinate
	reference "

  | former |
  self owner
    ifNotNil: [ 
      (self topRendererOrSelf owner isHandMorph
        and: [ (former := self formerOwner) notNil ])
        ifTrue: [ 
          former := former renderedMorph.
          ^ former isPlayfieldLike
            ifTrue: [ former ]
            ifFalse: [ former referencePlayfield ] ] ].
  self
    allOwnersDo: [ :o | 
      o isPlayfieldLike
        ifTrue: [ ^ o ] ].
  ^ SessionTemps current at: #'ActiveWorld'