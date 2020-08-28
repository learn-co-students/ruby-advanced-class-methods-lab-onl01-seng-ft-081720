# Song Class Methods
#   .create
#     instantiates and saves the song, and it returns the new song that was created (FAILED - 1)
#   .new_by_name
#     instantiates a song with a name property (FAILED - 2)
#   .create_by_name
#     instantiates and saves a song with a name property (FAILED - 3)
#   .find_by_name
#     can find a song present in @@all by name (FAILED - 4)
#     returns falsey when a song name is not present in @@all (FAILED - 5)
#   .find_or_create_by_name
#     invokes .find_by_name and .create_by_name instead of repeating code (FAILED - 6)
#     returns the existing Song object (doesn't create a new one) when provided the title of an existing Song (FAILED - 7)
#     creates a new Song object with the provided title if one doesn't already exist (FAILED - 8)
#   .alphabetical
#     returns all the song instances in alphabetical order by song name (FAILED - 9)
#   .new_from_filename
#     initializes a song and artist_name based on the filename format (FAILED - 10)
#   .create_from_filename
#     initializes and saves a song and artist_name based on the filename format (FAILED - 11)
#   .destroy_all
#     clears all the song instances from the @@all array (FAILED - 12)


class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end 

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
