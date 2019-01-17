def sluggish_octopus(fish_arr)
	longest = ""
	fish_arr.each_with_index do |fish1, idx1|
		fish_arr.each_with_index do |fish2, idx2|
			next if idx1 == idx2
			bigger = fish1.length > fish2.length ? fish1 : fish2
			longest = bigger if bigger.length > longest.length
		end
	end
	longest
end

def dominant_octopus(fish_arr)
	return fish_arr.first if fish_arr.length <= 1
	mid = fish_arr.length / 2
	left = dominant_octopus(fish_arr[0...mid])
	right = dominant_octopus(fish_arr[mid..-1])
	if left.length > right.length
		left
	else
		right
	end
end

def clever_octopus(fish_arr)
	longest = ""
	fish_arr.each { |fish| longest = fish if fish.length > longest.length }
	longest
end

def slow_dance(tile, tiles_array)
	tiles_array.each_with_index { |el, i| return i if el == tile }
end

def fast_dance(tile, new_tiles_data_structure)
	new_tiles_data_structure[tile]
end


if __FILE__ == $PROGRAM_NAME
	fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
	p sluggish_octopus(fish)
	p dominant_octopus(fish)
	p clever_octopus(fish)

	tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
	p slow_dance("up", tiles_array)
	p slow_dance("right-down", tiles_array)

	new_tiles_data_structure = {
			"up" => 0,
			"right-up" => 1,
			"right" => 2,
			"right-down" => 3,
			"down" => 4,
			"left-down" => 5,
			"left" => 6, 
			"left-up" => 7
	}
	p fast_dance("up", new_tiles_data_structure)
	p fast_dance("right-down", new_tiles_data_structure)
end