other
deferUpdates: aBoolean
  "Set the deferUpdates flag in the virtual machine. When this flag is
	true, BitBlt operations on the Display are not automatically
	propagated to the screen. If this underlying platform does not
	support deferred updates, this primitive will fail. Answer whether
	updates were deferred before if the primitive succeeds, nil if it fails."

  | wasDeferred |
  wasDeferred := (SessionTemps current
    at: #'DisplayScreenDeferringUpdates'
    ifAbsent: [ nil ]) == true.
  SessionTemps current at: #'DisplayScreenDeferringUpdates' put: aBoolean.
  ^ (self primitiveDeferUpdates: aBoolean) ifNotNil: [ wasDeferred ]