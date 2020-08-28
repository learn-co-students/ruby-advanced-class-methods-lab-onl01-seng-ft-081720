require 'pry'
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
    new_song = self.new
    @@all << new_song
    new_song 
    end
    
    def self.new_by_name(song)
      song_name = self.new
      song_name.name = song 
      song_name 
    end
    def self.create_by_name(namez)
      song_name = self.create
      song_name.name = namez
      song_name 
    end 
    def self.find_by_name(new_song)
      @@all.find {|x| x.name == new_song}
      end
      def self.find_or_create_by_name(string)
         self.find_by_name(string) || self.create_by_name(string)
                end
       
       def self.alphabetical
        @@all.sort_by  do |n| 
          n.name
         end
       end
      
       def self.new_from_filename(artist_file)
       new =  artist_file.split("\-")
          artist_name = new[0].strip
          name = new[1].strip.split(".")[0]
           new_song_artist = self.new 
           new_song_artist.artist_name = artist_name
           new_song_artist.name = name 
        new_song_artist 
     end 
     def self.create_from_filename(new_song)
       x = self.new_from_filename(new_song)
       x.save
     end
         
         def self.destroy_all
           @@all.clear 
           @@all
           end 
  
   
 
end
