events-filtering
addFilter: anObject to: aFilterGroup
  "Add anObject to the given listener group. Return the new group."

  | filters |
  filters := aFilterGroup.
  (filters notNil and: [ filters includes: anObject ])
    ifFalse: [ 
      filters
        ifNil: [ filters := Array with: anObject ]
        ifNotNil: [ filters := filters copyWith: anObject ]	"HACK WeakArray --> Array" ].
  filters := filters copyWithout: nil.	"obsolete entries"
  ^ filters