class Game
	
	def select_word(dictionary)
		valid = false
		until valid == true do
			word = dictionary[rand[0..dictionary.length]]
			if word.length > 5 && word.length < 13
				valid = true
			end
		end
		return word.downcase
	end
	
	def initialize
		dictionary = File.readlines("../dictionary.txt")
		answer = select_word(dictionary).split('')
		progress = Array.new(answer.size,"_")
		guesses = Array.new
		remainingGuesses = 5
	end
	
	def turn
		if remainingGuesses < 5
			puts "You have already guessed #{guesses}"
			puts "Here's your progress so far - #{progress}"
		end
		puts "Please guess a letter. You have #{remainingGuesses} remaining...."
		guess = gets.chomp!
		guesses.push(guess)
	end
	
	def checkGuess(guess)
		answer.each do |x|
			if x == guess
				progress[answer.index(x)] = guess
			end
		end
	end
	
	def play
		until remainingGuesses == 0 do
			if progress == answer
				puts "You win!"
			end
		end
			
	end
	
end