drawing
drawOn: aCanvas
  [ 
  aCanvas
    drawString: contents
    in: bounds
    font: self fontToUse
    color: color ]
    on: Error
    do: [ :err | Transcript show: 'string display failed' ]