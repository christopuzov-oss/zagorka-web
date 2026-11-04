require 'fileutils'

namespace :error_pages do
  desc 'Create nondigest versions of error pages'
  task nondigest: :environment do
    fingerprint = /\-[0-9a-f]{32,64}\./
    html_files = Rails.root.join 'public/assets/*.html'
    xml_files = Rails.root.join 'public/assets/*.xml'

    (Dir[html_files] + Dir[xml_files]).each do |file|
      next unless file =~ fingerprint
      nondigest = file.sub fingerprint, '.'

      destination = Rails.public_path.join(Pathname.new(nondigest).basename)
      if !File.exist?(destination) || File.mtime(file) > File.mtime(destination)
        FileUtils.cp file, destination, verbose: true, preserve: true
      end
    end
  end
end