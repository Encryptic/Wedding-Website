class DataFile < ActiveRecord::Base
  def self.save(upload)
    File.open(Rails.root.join('public', 'uploads', upload.original_filename), 'w') do |file|
        file.write(upload.read)
      end
  end
end