as yet unclassified
ceateButtonBarFor: aTestMorph
  | commitBtn abortBtn continueBtn exitBtn changeColorBtn |
  commitBtn := (SimpleButtonMorph newWithLabel: 'commit')
    openInWorld;
    target: aTestMorph;
    actionSelector: 'commit'.
  abortBtn := (SimpleButtonMorph newWithLabel: 'abort')
    openInWorld;
    left: commitBtn right;
    target: aTestMorph;
    actionSelector: 'abort'.
  continueBtn := (SimpleButtonMorph newWithLabel: 'continue')
    openInWorld;
    left: abortBtn right;
    target: aTestMorph;
    actionSelector: 'continue'.
  changeColorBtn := (SimpleButtonMorph newWithLabel: 'change color')
    openInWorld;
    left: continueBtn right;
    target: aTestMorph;
    actionSelector: 'changeColor'.
  exitBtn := (SimpleButtonMorph newWithLabel: 'exit')
    openInWorld;
    left: changeColorBtn right;
    target: aTestMorph;
    actionSelector: 'die'