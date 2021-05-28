# Tetris implementation using Ruby
In this project, an implementations of a custom Tetris will be made. This project's goal is to learn about subclassing, code reuse, analysis of another person's coding style and the Ruby language.

There will be a `runner.rb` to run the game from the command-line, a `graphics.rb` to display the game and a `provided.rb` file with starting code, the implementation should follow the rules provided as follows:

## Requirements for the game
* Your game should have all the features of the original Tetris game, as well as the enhancements.

* The subclasses must start with `My` followed by the name of the original class. For example, `MyTetris`.

* Do not add to or modify any classes defined in other files or the standard library.

* It is required that your board `MyBoard` has a next piece method that provides the same functionality
that `Board`’s `next piece` provides, which is that it sets `@current_block` to the next piece that will
fall, which might or might not be the cheat piece.

* You must have a `MyPiece` class and it must define a class constant `All_My_Pieces` that contains exactly
the ten pieces. It must not contain your cheat piece. It must be in the same format as the `All_Pieces` array in the
provided code.
* All your new pieces, including your cheat piece, must use the same format as the provided pieces.

* Do not use the Tk library directly in any way. The only use of Tk should occur indirectly by using instances of classes defined in `graphics.rb` as needed (only a little is needed). Do not have `require 'tk' in Tetris.rb`.

## Enhancements to the original game
The enhanced version will have the following changes

* The player can press `u` to make the piece rotate 180 degrees.

* There will be 10 unique pieces instead of the classic 7.
![New pieces](https://github.com/rokobo/Tetris-game/blob/master/data/pieces.png?raw=true)
* The player can press `c` to get a 1x1 cheat piece, however, the player must have more than 100 points, in which case, there will be a 100 point penalty for cheating.

