Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # Adjust this to allow requests from specific domains
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :delete, :options, :head],
        expose: ['Authorization']  # List any headers that should be exposed
    end
  end
  