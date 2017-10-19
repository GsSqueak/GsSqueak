loading
analyzeAdditions
  | sorter |
  sorter := PharoGsCypressDependencySorter new
    addAll: self additions;
    addExternalProvisions: self provisions;
    yourself.
  additions := sorter orderedItems.
  requirements := sorter externalRequirements.
  unloadable := sorter required