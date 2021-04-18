module Configuration
  extend ActiveSupport::Concern
  included do
    before do
      if @env["CONTENT_TYPE"] == "application/json"
        request.body.rewind
        params.merge!(JSON.parse(request.body.read))
      end
    end

    set :root, Pathname.new(__dir__).parent
    set :public_folder, root.join('public')

    Cloudinary.config do |config|
      config.cloud_name = 'dgo3gjxnl'
      config.api_key = '927779654336266'
      config.api_secret = 'p3UIl68-85RqeT6jhvdX91SPMX8'
      config.static_file_support = true
    end

    CarrierWave.configure do |config|
      config.root = public_folder
    end
    
    register Sinatra::Reloader
    
    register Sinatra::RequiredParams
    
    register Sinatra::RespondWith
    
    register Sinatra::ContentFor
    
    register Sinatra::Flash
    
    
    # sessions
    enable :sessions
    set :session_secret, ENV["SINATRA_SECRET_KEY"] || File.read("config/.secret_key")

    # Asset pipeline
    set :assets_prefix, '/assets'
    set :sprockets, Sprockets::Environment.new
    set :digest_assets, false
    set :views, 'app/views'

    configure do
      sprockets.append_path root.join('app', 'assets', 'stylesheets')
      sprockets.append_path root.join('app', 'assets', 'javascripts')
      sprockets.append_path root.join('app', 'assets', 'images')
      uglify = Uglifier.new(:harmony => true)
      sprockets.js_compressor  = uglify
      sprockets.css_compressor = :scss


      Sprockets::Helpers.configure do |config|
        config.environment = sprockets
        config.prefix      = assets_prefix
        config.digest      = digest_assets
        config.public_path = public_folder

        # Force to debug mode in development mode
        # Debug mode automatically sets
        # expand = true, digest = false, manifest = false
        config.debug       = true if development?
      end
    end

    helpers do
      include Sprockets::Helpers
    end
    

    # localisation
    configure do
      I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
      I18n.load_path += Dir[root.join('config', 'locales', '*.yml')]
      I18n.backend.load_translations
    end
  end
end