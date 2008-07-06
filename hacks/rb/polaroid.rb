require "rubygems"
require "rmagick"
require 'pp'

def exit_with_help_message
  puts "Usage: #{$0} /path/to/image.png"
  exit
end

module Magick
  class Image
    def polaroidify
      image = self
      image.border!(18, 18, "#f0f0ff")
      image.background_color = "none"

      # Warpy
      amplitude = image.columns * 0.01
      wavelength = image.rows  * 2
      image.rotate!(90)
      image = image.wave(amplitude, wavelength)
      image.rotate!(-90)
      
      # Shadowy
      shadow = image.flop
      shadow = shadow.colorize(1, 1, 1, "gray75")
      shadow.background_color = "none"
      shadow.border!(10, 10, "white")
      shadow = shadow.blur_image(0, 3)
      
      # Mergy
      image = shadow.composite(image, -amplitude/2, 5, Magick::OverCompositeOp)
      image.background_color = "white"
      image.rotate!(-5)
      image.trim!
      
      image
    end    
  end
end

def write_to_file!(image)
  out = @image_path.sub(/\./, "-print.")
  puts "Writing #{out}"
  image.write(out)
end

if $0 == __FILE__
  exit_with_help_message unless ARGV[0] && File.exists?(ARGV[0])

  @image_path = ARGV[0]
  image = Magick::Image.read(@image_path).first.polaroidify
  write_to_file!(image)
end