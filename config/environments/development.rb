Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # In development, always have caching enabled, as it will be used with the
  # dalli (memcached) store for file parsing and server line storage.
  config.action_controller.perform_caching = true

  <<~CONFIGURATION_NOTES

  1) Compression is enabled by default, which will use GZIP compression for
     objects (lines) that are greater than 1K in size. This will optimize
     storage constraints as lines approach the server memory limit.
  2) A namespace is created in the event that we want to share the memcached
     (future) cluster with other applications. Multiple applications would be
     able to hit the same server, and guaranteed to access the correct data
     based on this namespace.
  3) We set NO expires_in value here, which means that the cache keys will not
     expire, unless is application is brought down or restarted.

  CONFIGURATION_NOTES

  config.cache_store = :dalli_store, 'localhost', {
    compress: true,
    namespace: 'salsisy-line-server'
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log


  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
