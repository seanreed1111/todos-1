require "./song_library.rb"

def jukebox(command)
	if command.downcase == "list"
		list_library
	else
		parse_command(command)
	end
end

def list_artist(artist, album_hash, t_f)
	 artist_list = "\n---------------\n"
	 artist_list += "#{artist}:\n"
	 artist_list += "---------------"
	 if t_f
		album_hash[artist][:albums].each do |album_name, songs_hash|
			artist_list += "\n#{album_name}:\n\t"
			artist_list += songs_hash[:songs].join("\n\t")
		end
	 else
		album_hash[:albums].each do |album_name, songs_hash|
			artist_list += "\n#{album_name}:\n\t"
			artist_list += songs_hash[:songs].join("\n\t")
	 	end
	 end
	 artist_list
end

def list_library
	lib = full_library
	lib.each do |artist, album_hash|
		puts list_artist(artist, album_hash, false)
	end
	puts
end

def parse_command(command)
	parse_artist(command, full_library) || play_song(command, full_library) || not_found(command)
end

def parse_artist(command, lib)
	cmd = command.to_sym
	parsed = false
	if lib.has_key?(cmd)
		puts list_artist(command, lib[cmd], false)
		parsed = true
	else
		lib.each do |artist, hash|
			if command.downcase == artist.to_s.gsub("_"," ").downcase
				puts list_artist(artist, lib, true)
				parsed = true
				break
			end
		end
	end
	parsed
end

def play_song(command, lib)
	lib.each do |artist, hash|
		hash.each do |album_name, albums_hash|
			albums_hash.each do |album, songs_hash|
				songs_hash.each do |songs, song_array|
					song_array.each do |song|
						if song.downcase == command.downcase
							puts "Now Playing: #{artist}: #{album} - #{song}\n\n"
							return true
						end
					end
				end
			end
		end
	end
	false
end

def not_found(command)
	puts "I did not understand '#{command}'!\n\n"
	true
end