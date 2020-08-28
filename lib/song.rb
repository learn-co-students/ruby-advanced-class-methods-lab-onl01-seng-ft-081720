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
    song = self.new #creates song
    @@all<<song #pushes the song into the array to save it
    song #calls said song
  end
   
  def self.new_by_name (name)
    song = self.new #creates a song from what it gives us
    song.name = name # us assigning the name to song
    song #returns the instance id
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
      self.find_by_name(name) ||
      self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename (filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    song
  end

  def self.create_from_filename (filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    self.all << song
    song
  end

  def self.destroy_all 
    self.all.clear
  end

end

