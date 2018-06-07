initialization
initializeDefaultFont
    | textStyle |
    textStyle := TextStyle new.
    textStyle newFontArray: { StrikeFont createDejaVu: 14 }.
    TextConstants at: #DefaultTextStyle put: textStyle
