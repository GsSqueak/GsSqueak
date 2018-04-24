arithmetic
+ aNumber
  "Returns the sum of the receiver and anInteger."

  <primitive: 258>
  
aNumber isFraction ifTrue:
    [^Fraction numerator: self * aNumber denominator + aNumber numerator denominator: aNumber denominator].
^ aNumber adaptToInteger: self andSend: #+
