module Iterable
  ##
  #
  # Interact with /metadata/{table} API endpoints
  #
  # @example Creating metadata table endpoint object
  #   # With default config
  #   templates = Iterable::MetadataTable.new
  #   templates.get
  #
  #   # With custom config
  #   conf = Iterable::Config.new(token: 'new-token')
  #   templates = Iterable::MetadataTable.new(config)
  class MetadataTable < ApiResource
    attr_reader :name
    ##
    #
    # Initialize a MetadataTable with a table name
    #
    # @param name [String] The name of the table to interact with
    # @param conf [Iterable::Config] A config to optionally pass for requests
    #
    # @return [Iterable::MetadataTable]
    def initialize(name, conf = nil)
      @name = name
      super conf
    end

    ##
    #
    # Add metadata for table
    #
    # @param key [String] Key of metadata to add
    # @param value [Hash] Value of metadata key as a hash of key/value data
    #
    # @return [Iterable::Response] A response object
    def add(key, value = {})
      Iterable.request(conf, base_path(key)).put(value: value)
    end

    private

    def base_path(key = nil)
      path = "/metadata/#{@name}"
      path += "/#{key}" if key
      path
    end
  end
end
