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
    @name = Song.new
    @@all << @name
    @name
  end

  def self.new_by_name(name)
    @name = Song.new
    @name.name = name
    @name
  end

  def self.create_by_name(name)
    @name = Song.new
    @name.name = name
    @@all << @name
    @name
  end

  def self.find_by_name(name)
    @@all.detect do |song_element|
      song_element.name == name
    end
  end

  def self.find_or_create_by_name(name)
    match = self.find_by_name(name)
    if (!match)
      self.create_by_name(name)
    else
      match
    end
  end

  def self.alphabetical
    @@all.sort do |a, b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(filename)
    # "Taylor Swift - Blank Space.mp3"


    @song = Song.new
    @song.artist_name = filename.split("-")[0].strip
    @song.name = filename.split("-")[1].strip.split(".")[0]
    @song
  end
  def self.create_from_filename(filename)

    @song = Song.new
    @song.artist_name = filename.split("-")[0].strip
    @song.name = filename.split("-")[1].strip.split(".")[0]
    @@all << @song
  end
  def self.destroy_all
    @@all.clear

  end

end
