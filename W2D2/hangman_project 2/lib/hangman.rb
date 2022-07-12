class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def self.random_word
    return random_word = DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    f_arr = []
    @secret_word.each_char.with_index do |c, i|
      if c == char
        f_arr << i
      end
    end
    f_arr
  end

  def fill_indices(char,arr)
    @guess_word.each_with_index do |ele, i|
      if arr.include?(i)
        @guess_word[i] = char
      end
    end
    @guess_word
  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      if !@secret_word.include?(char)
        @remaining_incorrect_guesses -= 1
      else
        get_matching_indices(char)
        fill_indices(char, get_matching_indices(char))
      end
      return true
    end

  end

  def ask_user_for_guess
    p "Enter a char:"
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @guess_word != @secret_word && @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    elsif @guess_word != @secret_word && remaining_incorrect_guesses != 0
      return false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end
  end

end
