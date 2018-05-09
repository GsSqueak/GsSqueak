instance creation
fromList: anArray
  | cons |
  anArray size = 0
    ifTrue: [ ^ nil ].
  anArray size = 1
    ifTrue: [ ^ self car: (anArray at: 1) ].
  anArray size = 2
    ifTrue: [ ^ self car: (anArray at: 1) cdr: (self car: (anArray at: 2)) ].
  anArray size to: 1 by: -1 do: [ :index | cons := self car: (anArray at: index) cdr: cons ].
  ^ cons