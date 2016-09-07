class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :thumb do
     process resize_to_fill: [442, 306]
  end

  version :thumb2 do
     process resize_to_fill: [683, 474]
  end

  

  version :thumb4 do
     process resize_to_fill: [8, 8]
  end

  # include Miro
  # Miro.options[:method] = 'histogram'
  # Miro.options[:color_count] = 4
  #
  # colors = Miro::DominantColors.new('http://localhost:3000/' + @event.image.thumb3.url)
  # @colors = colors.to_hsl.sort {|a,b| b[2] <=> a[2]}
  #
  # @colors.each do |hsl|
  #   hsl[0] = (hsl[0]*360).to_s
  #   hsl[1] = (hsl[1]*100).to_s+"%"
  #   hsl[2] = (hsl[2]*100).to_s+"%"
  # end
  #
  # @luminosity = 0
  #
  # @colors.each do |hsl|
  #   @luminosity += hsl[2].to_f
  # end
  #
  # if @luminosity <= 100
  #   @bg_color = @colors[3]
  #
  #   @secondary_color = []
  #
  #   @bg_color.each do |x|
  #     @secondary_color.push(x)
  #   end
  #
  #   @secondary_color[2] = (@secondary_color[2].to_f + 10).to_s + "%"
  #
  #   @text_color = []
  #
  #   @colors[0].each do |x|
  #     @text_color.push(x)
  #   end
  #
  #   @secondary_text = []
  #
  #   @colors[1].each do |x|
  #     @secondary_text.push(x)
  #   end
  #
  #   while @text_color[2].to_f - @bg_color[2].to_f <= 70 do
  #     @text_color[2] = (@text_color[2].to_f + 5).to_s + "%"
  #   end
  #
  #   while @secondary_text[2].to_f - @secondary_color[2].to_f <= 30 do
  #     @secondary_text[2] = (@secondary_text[2].to_f + 5).to_s + "%"
  #   end
  #
  # end
  #
  # if @luminosity >= 100
  #
  #   @bg_color = @colors[0]
  #
  #   @secondary_color = []
  #
  #   @bg_color.each do |x|
  #     @secondary_color.push(x)
  #   end
  #
  #   @secondary_color[2] = (@secondary_color[2].to_f + 10).to_s + "%"
  #
  #   @text_color = []
  #
  #   @colors[3].each do |x|
  #     @text_color.push(x)
  #   end
  #
  #   @secondary_text = []
  #
  #   @colors[1].each do |x|
  #     @secondary_text.push(x)
  #   end
  #
  #   while @secondary_color[2].to_f - @bg_color[2].to_f <= 20 do
  #     @secondary_color[2] = (@secondary_color[2].to_f + 5).to_s + "%"
  #   end
  #
  #   while @secondary_text[2].to_f - @secondary_color[2].to_f >= 15 do
  #     @secondary_text[2] = (@secondary_text[2].to_f - 5).to_s + "%"
  #   end
  #
  # end


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
