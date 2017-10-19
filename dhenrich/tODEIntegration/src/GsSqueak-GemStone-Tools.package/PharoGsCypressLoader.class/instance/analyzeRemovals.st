loading
analyzeRemovals
  | sorter |
  sorter := PharoGsCypressDependencySorter new
    addAll: self removals;
    yourself.
  removals := sorter orderedItems reverse