submorphs-add/remove
dismissViaHalo
  "The user has clicked in the delete halo-handle. This provides a hook in
	case some concomitant action should be taken, or if the particular
	morph is not one which should be put in the trash can, for example."

  | cmd |
  self setProperty: #'lastPosition' toValue: self positionInWorld.
  self dismissMorph.
  TrashCanMorph preserveTrash
    ifTrue: [ 
      TrashCanMorph slideDismissalsToTrash
        ifTrue: [ self slideToTrash: nil ]
        ifFalse: [ TrashCanMorph moveToTrash: self ] ].
  cmd := Command new cmdWording: 'dismiss ' translated , self externalName.
  cmd
    undoTarget: (SessionTemps current at: #'ActiveWorld')
    selector: #'reintroduceIntoWorld:'
    argument: self.
  cmd
    redoTarget: (SessionTemps current at: #'ActiveWorld')
    selector: #'onceAgainDismiss:'
    argument: self.
  (SessionTemps current at: #'ActiveWorld') rememberCommand: cmd