as yet unclassified
with: anPixel with: anSecondPixel
  "Answer an instance of me containing anObject."

  ^ (self new: 2)
    at: 1 put: anPixel;
    at: 2 put: anSecondPixel;
    yourself