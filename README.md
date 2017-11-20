#Gyazo Image Downloader

This program will download your complete collection of images from Gyazo.

## Downloading The App
1. Download zip [here](https://github.com/jhubbardsf/gyazo-image-downloader/archive/master.zip) or git clone the repository.
2. Unzip it

## Getting Gyazo Application Access Key
1. Go to Gyazo's [application page](https://gyazo.com/oauth/applications)
2. Create a new application with any name and 'http://localhost/' as the callback
3. Click submit and then click on your new applications name which is a link
4. Generate access key and put it in the correct location in config.yml

##Installing Software
For Windows:

1. Install Ruby 2.3.1 from [RubyInstaller](http://rubyinstaller.org/downloads/)
2. In a CMD navigate to the unzipped program directory
3. In the CMD window install bundler (`gem install bundler`)
4. In the CMD window run `bundle install`
5. Lastly run `ruby downloader.rb` and all your pictures will be saved
