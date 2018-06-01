*BPMorphic
refineRedoTarget: target selector: aSymbol arguments: arguments in: refineBlock
  "Any object can override this method to refine its redo specification"

  ^ refineBlock value: target value: aSymbol value: arguments