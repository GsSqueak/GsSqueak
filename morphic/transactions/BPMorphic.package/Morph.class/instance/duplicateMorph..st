meta-actions
duplicateMorph: evt
  "Make and return a duplicate of the receiver's argument"

  | dup |
  dup := self duplicate.
  evt hand grabMorph: dup from: self owner.	"duplicate was ownerless so use #grabMorph:from: here"
  ^ dup