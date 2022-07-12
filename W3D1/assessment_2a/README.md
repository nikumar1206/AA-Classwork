## Assessment 2a - Tic Tac Toe

### Summary

In this assessment you will build Tic Tac Toe. Classic Tic Tac Toe is a game where two players, X and O, take turns marking spaces in an `3 * 3` grid. The first player to place 3 of their mark in any row, column, or diagonal wins the game.

**The version of Tic Tac Toe that you will be building will allow for a grid of any size, `n * n`. This means that the first player to place `n` of their marks in any row, column, or diagonal wins the game.**

### Usage

1. `cd` into the project root directory
2. `bundle install` to install dependencies
3. `bundle exec rspec` to run all tests

### Objective

Your objective is to pass all 36 test specs provided by writing code in the `/lib` files. You can view the test cases in `/spec`.

```bash
/assessment_2a
├── Gemfile
├── README.md
├── lib
│   ├── board.rb
│   ├── play_tic_tac_toe.rb
│   ├── player.rb
│   └── tic_tac_toe.rb
└── spec
    ├── board_spec.rb
    ├── player_spec.rb
    └── tic_tac_toe_spec.rb
```

Note that their may be some initial code provided in some of the `/lib` files. Once you pass all specs, you can run the `ruby lib/play_tic_tac_toe.rb` to play your final product. We recommend you implement the code in the following order: `Board`, `Player`, `TicTacToe`.
