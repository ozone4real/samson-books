require './config/environment'

class MigrationCheck
  def initialize(app)
    @app = app
  end

  def call(env)
    if ActiveRecord::MigrationContext.new('./db/migrate').needs_migration?
      raise ActiveRecord::PendingMigrationError.new 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
    end
    @app.call(env)
  end
end


# Assets pipeline
map ApplicationController.assets_prefix do
  run ApplicationController.sprockets
end


run ApplicationController

use MigrationCheck

ApplicationController.subclasses.each {|klass| use klass }
