require "rails"
require "k3cms/core/railtie"
require 'k3cms_inline_editor' # this gem's javascripts *must* come after k3cms_inline_editor's
require "k3cms_image_mapper"

module K3cms
  module ImageMapper
    class Railtie < Rails::Engine
      puts self

      config.before_initialize do
        # Anything in the .gemspec that needs to be *required* should be required here.
        # This is a workaround for the fact that this line:
        #   Bundler.require(:default, Rails.env) if defined?(Bundler)
        # in config/application.rb only does a 'require' for the gems explicitly listed in the *app*'s Gemfile -- not for the gems *they* might depend on (which are listed in a .gemspec file, not a Gemfile).
      end

      config.action_view.javascript_expansions[:k3cms].            concat [
        'jquery.image_mapper.js',
        'k3cms/image_mapper.js',
      ]
      #config.action_view.javascript_expansions[:k3cms_not_editing].concat [ 'k3cms/image_mapper.not_editing.js' ]
      config.action_view.javascript_expansions[:k3cms_editing].    concat [
        'jquery.tools.min.js',
        'raphael-min.js',
        'jquery.tmpl.min.js',
        'k3cms/image_mapper.editing.js',
      ]
      config.action_view.stylesheet_expansions[:k3cms].            concat [
        'jquery.image_mapper.css',
        'k3cms/image_mapper.css',
      ]

      initializer 'k3cms.image_mapper.cells_paths' do |app|
        Cell::Base.view_paths += [config.root + 'app/cells',
                                  config.root + 'app/views']
      end
    end
  end
end
