*BPToolsTode
browseEnvironment7: aButtonBarClientElement
  | topez |
  topez := aButtonBarClientElement topez.
  topez applicationEnvironment
    classLookupEnvironmentId: 7;
    methodCompilationEnvironmentId: 7;
    yourself.
  System commit.
  ^ true