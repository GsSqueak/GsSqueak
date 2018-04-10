submorphs-accessing
submorphBefore
  "Return the submorph after (behind) me, or nil"

  | ii |
  self owner ifNil: [ ^ nil ].
  ^ (ii := self owner submorphIndexOf: self) = 1
    ifFalse: [ self owner submorphs at: ii - 1 ]