submorphs-accessing
submorphAfter
  "Return the submorph after (behind) me, or nil"

  | ii |
  self owner ifNil: [ ^ nil ].
  ^ (ii := self owner submorphIndexOf: self) = self owner submorphs size
    ifFalse: [ self owner submorphs at: ii + 1 ]