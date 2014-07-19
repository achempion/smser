require 'rails/generators'

module Smser
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)

    desc 'Create a Smser initializer file'

    def copy_initializer
      template 'smser.rb', 'config/initializers/smser.rb'
    end
  end
end