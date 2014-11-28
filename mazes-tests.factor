USING: tools.test mazes mazes.private 
kernel math literals nested-comments ;
IN: mazes.tests

CONSTANT: UP         {  0 -1 }
CONSTANT: DOWN       {  0  1 }
CONSTANT: LEFT       { -1  0 }
CONSTANT: RIGHT      {  1  0 }

[ "+ +-+-+ +-+ + +-+ + + " ]
[ "+  +--+--+  +--+  +  +--+  +  +" 2>1 ] unit-test

[ "+  +--+--+  +--+  +  +--+  +  +  " ]
[ "+ +-+-+ +-+ + +-+ + + " 1>2 ] unit-test

[ $ M1 ]
[ { "+.+"
    "# |" 
    "+.+" } { 0 1 } get-mark ] unit-test

[ { "+.+"
    "##|" 
    "+.+" } ]
[ { "+.+"
    "# |" 
    "+.+" } { 1 1 } $ M1 set-mark ] unit-test

[ { ${ DOWN M0 } ${ LEFT M1 } ${ RIGHT M2 } } ] 
[ { "+-+"
    "# ." 
    "+ +" } { 1 1 } passages ] unit-test

[ { ${ DOWN M0 } ${ UP M0 } ${ LEFT M1 } } ] 
[ { "+ +"
    "# |" 
    "+ +" } { 1 1 } passages ] unit-test

[ { "+-+"
    "##|" 
    "+ +" } $ DOWN { 1 1 } ] 
[ { "+-+"
    "# |" 
    "+ +" } $ RIGHT { 0 1 } tremaux-step ] unit-test

[ { "+-+"
    "##|" 
    "+#+"
    "| |" } $ DOWN { 1 2 } ] 
[ { "+-+"
    "# |" 
    "+ +"
    "| |" } $ RIGHT { 0 1 } tremaux-step tremaux-step ] unit-test

[ { "+-+-"
    "#.##" 
    "+-+-" } $ LEFT { 1 1 } ] 
[ { "+-+-"
    "####" 
    "+-+-" } $ RIGHT { 1 1 } tremaux-step ] unit-test

[ { "-+-+"
    "#..|" 
    "-+-+" } $ LEFT { 1 1 } ] 
[ { "-+-+"
    "## |" 
    "-+-+" } $ RIGHT { 1 1 } tremaux-step tremaux-step ] unit-test

[ { "+-+-+-+-+"
    " #......|" 
    "+#+-+.+.+" 
    "|###|.|.|" 
    "+-+ +-+-+" } $ DOWN { 3 3 } ]
[ { "+-+-+-+-+"
    "        |" 
    "+ +-+ + +" 
    "|   | | |" 
    "+-+ +-+-+" } $ RIGHT $ START-POS 25 [ tremaux-step ] times ] unit-test

[ { "+-+-+-+-+"
    " #|###..|"
    "+#+#+#+-+"
    "|###|### "
    "+-+-+-+-+" } ]
[ { "+-+-+-+-+"
    "  |     |"
    "+ + + +-+"
    "|   |    "
    "+-+-+-+-+" } tremaux-solve ] unit-test

