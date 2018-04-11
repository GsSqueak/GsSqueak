submorphs-add/remove
privateDelete
  "Remove the receiver as a submorph of its owner"

  self owner ifNotNil: [ self owner removeMorph: self ]