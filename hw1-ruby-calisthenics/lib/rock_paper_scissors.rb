# ESaaS 1
# HW 1 Part 3
# Comments preceding method definitions are the homework problems from the instructors, not my own commentary.

class RockPaperScissors

  class NoSuchStrategyError < StandardError; end

  # Create a `RockPaperScissors` class with a *class* method `winner` that takes two 2-element arrays, and returns the one representing the winner.
  # If either player's strategy is something other than "R", "P" or "S" (case-SENSITIVE), the method should raise a `RockPaperScissors::NoSuchStrategyError`
  # exception and provide the message: "Strategy must be one of R,P,S".  If both players use the same strategy, the first player is the winner.
  def self.winner(player1, player2)
    strategy = ["R", "P", "S"]
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless strategy.include?(player1[1]) && strategy.include?(player2[1])
    return player1 if player1[1] == player2[1]
    case player1[1]
      when "R"
        player2[1] == "S" ? player1 : player2
      when "P"
        player2[1] == "R" ? player1 : player2
      when "S"
        player2[1] == "P" ? player1 : player2
    end
  end

  # Write a method `RockPaperScissors.tournament_winner' that takes a tournament encoded as an array and returns the winner.
  # You can assume that the array is well formed (that is, there are 2^n players, and each one participates in exactly one match per round). 
  def self.tournament_winner(tournament)
    if tournament[0][0].class == String
      winner(tournament[0], tournament[1])
    else
      self.tournament_winner([self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1])])
    end
  end

end

