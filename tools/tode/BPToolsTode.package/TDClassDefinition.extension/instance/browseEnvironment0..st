*BPToolsTode
browseEnvironment0: aButtonBarClientElement
  | topez |
  topez := aButtonBarClientElement topez.
  topez inspect.
  topez applicationEnvironment
    classLookupEnvironmentId: 0;
    methodCompilationEnvironmentId: 0;
    yourself.
  System commit.
  ^ true