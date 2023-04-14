module DecoratedPrint
	def printing text
		decoration = '-' * 5 # This will repeat the character 5 times
		puts decoration + text + decoration
	end
end

module Legs
	include DecoratedPrint # This is a mixin (a module that is included in another module or class)

	def frontal_kick
		printing 'Frontal Kick'
	end

	def side_kick
		printing 'Side Kick'
	end
end

module Arms
	include DecoratedPrint # This is a mixin (a module that is included in another module or class)

	def punch
		printing 'Punch'
	end

	def uppercut
		printing 'Uppercut'
	end
end

class Fighter
	include Legs
	include Arms
end

fighter = Fighter.new
fighter.frontal_kick
fighter.side_kick
fighter.punch
fighter.uppercut
