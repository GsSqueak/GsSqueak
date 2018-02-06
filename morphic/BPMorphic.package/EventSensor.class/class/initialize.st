class initialization
initialize
  "Smalltalk addToStartUpList: self before: ProcessorScheduler."

  "Smalltalk addToShutDownList: self."

  self installKeyDecodeTable.
  self installMouseDecodeTable	"self install"