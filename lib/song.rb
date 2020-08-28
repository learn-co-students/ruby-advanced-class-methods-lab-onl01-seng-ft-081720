class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    song.save
    song
  end

  def Song.new_by_name(name)
      song = self.new
      song.name = name
      song
  end
  
  def Song.create_by_name(title)
      song = self.create
      song.name = title
      song.save
      song
  end

  def Song.find_by_name(name)
   @@all.detect{ |s| s.name == name }
  end

  def Song.find_or_create_by_name(name)
       self.find_by_name(name)|| self.create_by_name(name)
  end

  def Song.alphabetical
    self.all.sort_by{ |song| song.name}.uniq
  end

  def Song.new_from_filename(filename)
    song = self.new
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def Song.create_from_filename(filename)
    song = self.create
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
  end

  def Song.destroy_all
    self.all.clear
  end
end

