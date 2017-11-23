*BPToolsTode
browseEnvironment7: aButtonBarClientElement
  | topez |
  topez := aButtonBarClientElement topez.
  topez inspect.
  topez applicationEnvironment
    classLookupEnvironmentId: 7;
    methodCompilationEnvironmentId: 7;
    yourself.
  System commit.
  ^ true