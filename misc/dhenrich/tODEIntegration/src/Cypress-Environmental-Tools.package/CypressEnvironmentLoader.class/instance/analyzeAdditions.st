loading
analyzeAdditions
  | sorter |
  sorter := CypressEnvironmentDependencySorter new
    addAll: self additions;
    addExternalProvisions: self provisions;
    yourself.
  additions := sorter orderedItems.
  requirements := sorter externalRequirements.
  unloadable := sorter required