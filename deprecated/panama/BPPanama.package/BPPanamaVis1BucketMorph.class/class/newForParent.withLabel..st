as yet unclassified
newForParent: aParent withLabel: aLabel
  | newbie |
  newbie := self new.
  newbie parent: aParent.
  newbie label: aLabel.
  ^ newbie