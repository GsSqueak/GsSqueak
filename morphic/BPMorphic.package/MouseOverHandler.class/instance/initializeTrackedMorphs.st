initialize-release
initializeTrackedMorphs
  leftMorphs := OrderedCollection new.
  overMorphs := WriteStream on: Array new.
  enteredMorphs := WriteStream on: Array new