require 'pry'
class Song
  #creates the methods :name and :artist_name
  attr_accessor :name, :artist_name
  #creates an empty array
  @@all = []
  #returns a boolean value true if all the objects 
  #in the enumerable satisfies the given condition, else it returns false.
  def self.all
    #calls on the all array.
    @@all
  end
#makes it possible to save all of the songs
  def save
    #.class provides functionality to the class itself
    self.class.all << self
  end

  def self.create #class methods
    song = self.new
    self.all << song
    song
  end
#why did I have to have both of the following methods,

  def self.new_by_name(title) #class methods
    song = self.new
    song.name = title
    song
  end
#what is the difference between these too?
  def self.create_by_name(title) #class methods
    #creates a new song assign the new song then returns it
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title) #class finder
    #.detect - returns the first element which satisfies the given condition in the block. 
    #If there is no block, then it returns the enumerator itself.
    found = self.all.detect {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
    #setting a variable to the method find by name
    #found = self.find_by_name(title)
    #if the result is true then it returns 
    #if result
     # result
   # else
      #creates a new song an returns the song instance
     # self.create_by_name(title)
    #end
  end

  def self.alphabetical
    #sorts all of the songs in alphabetical order and returns them
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    #chomp is a string class method in ruby then used to return new string with the given record
    #separator removed from the end of str = string
    #chomp method will also removes carriage return characters 
    song_array[1] = song_array[1].chomp(".mp3")
    #then creates new instance
    song = self.new
    #sets the song names to song_array[1]
    song.name = song_array[1]
    #then sets the artist name to song array
    song.artist_name = song_array[0]
    #returns song
    song
  end

  def self.create_from_filename(filename)
    file = self.new_from_filename(filename)
    song = self.create
    song.name = file.name
    song.artist_name = file.artist_name
    song
  end
  
#clears all the song instances from the @@all array
  def self.destroy_all
    self.all.clear
  end
  
end