meta-actions
potentialTargets
  "Return the potential targets for the receiver.
	This is derived from Morph>>potentialEmbeddingTargets."

  self owner ifNil: [ ^ #() ].
  ^ self owner morphsAt: self referencePosition behind: self unlocked: true not