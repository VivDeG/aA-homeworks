FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus
	longest = ""
	FISH.each_with_index do |fish1, idx1|
		FISH.each_with_index do |fish2, idx2|
			next if idx1 == idx2
			bigger = fish1.length > fish2.length ? fish1 : fish2
			longest = bigger if bigger.length > longest.length
		end
	end
	longest
end

def clever_octopus
	longest = ""
	FISH.each { |fish| longest = fish if fish.length > longest.length }
	longest
end

if __FILE__ == $PROGRAM_NAME
	p sluggish_octopus
	p clever_octopus
end