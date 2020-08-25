class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    array = file_name.slice(0, file_name.length - 4).split(" - ")
    song = self.new_by_name(array[1])
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(file_name)
    array = file_name.slice(0, file_name.length - 4).split(" - ")
    song = self.create_by_name(array[1])
    song.artist_name = array[0]
    song
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end
end
