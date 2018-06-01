model access
getSelection
  "Answer the model's selection interval."

  getSelectionSelector ifNil: [ ^ SqueakInterval from: 1 to: 0 ].	"null selection"
  ^ model perform: getSelectionSelector