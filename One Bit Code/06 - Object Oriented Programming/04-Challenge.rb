# Create a program where you have the following classes:
# - Athlete
# - FootballPlayer
# - MarathonRunner

class Athlete
	def compete
		puts "Participating in a competition"
	end
end

class FootballPlayer < Athlete
   def run
		puts "Running after the ball"
	end
end

class MarathonRunner < Athlete
	def run
		puts "Running the circuit"
	end
end

football_player = FootballPlayer.new
football_player.compete
football_player.run

marathon_runner = MarathonRunner.new
marathon_runner.compete
marathon_runner.run
