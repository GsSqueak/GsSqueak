private
flushCache
  "Flush my cached bit pattern."

  self bitPatternCache cachedDepth: nil.
  self bitPatternCache cachedBitPattern: nil