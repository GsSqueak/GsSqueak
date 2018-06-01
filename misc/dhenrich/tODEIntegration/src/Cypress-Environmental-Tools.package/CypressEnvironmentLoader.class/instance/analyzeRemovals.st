loading
analyzeRemovals
  | sorter |
  sorter := CypressEnvironmentDependencySorter new
    addAll: self removals;
    yourself.
  removals := sorter orderedItems reverse