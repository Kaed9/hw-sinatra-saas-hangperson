class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
	def initialize(word)
		@word = word
		@guesses = ''
		@wrong_guesses = ''
	end

	attr_accessor :word, :guesses, :wrong_guesses
  
	def self.get_random_word
		require 'uri'
		require 'net/http'
		uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
		Net::HTTP.post_form(uri ,{}).body
	end
  
	def guess(letter)
		if letter == '' || letter == nil || letter !~ /^[a-zA-Z0-9]*$/
			raise ArgumentError.new("Invalid input!")
		end
	
		@guesses.each_char do |x|
			if letter.downcase == x
				return false
			end
		end
		
		@wrong_guesses.each_char do |x|
			if letter.downcase == x
				return false
			end
		end
	
		count = 0
		@word.each_char do |x|
			if letter.downcase == x
				count += 1
			end
		end
		#return "Guess is right!" if letter.downcase =~ /(#{word.to_s})/
		#return "Guess is wrong!" if letter.downcase !~ /(#{word.to_s})/
		if count > 0
			@guesses << letter.downcase
			return true
		else
			@wrong_guesses << letter.downcase
			return false
		end
	end
	
	#def check_win_or_lose
	#end
	
	#def word_with_guesses
	#end
end
