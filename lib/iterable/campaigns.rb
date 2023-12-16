# typed: true

module Iterable
  ##
  #
  # Interact with /campaigns API endpoints
  #
  # @example Creating campaigns endpoint object
  #   # With default config
  #   campaigns = Iterable::Campaigns.new
  #   campaigns.all
  #
  #   # With custom config
  #   conf = Iterable::Config.new(token: 'new-token')
  #   campaigns = Iterable::Campaigns.new(config)
  class Campaigns < ApiResource
    ##
    #
    # Get all campaigns
    #
    # @return [Iterable::Response] A response object
    sig { returns(Iterable::Response) }
    def all
      Iterable.request(conf, '/campaigns').get
    end

    ##
    #
    # Create a new campaign. Requires a name, templateId and at least one listId
    #
    # @param name [String] The name of the campaign
    # @param template_id [Integer] The templateId to use for the campaign
    # @param list_ids [Array] Array of listIds to use for the campaign
    # @param attrs [Hash] Any other campaign attributes to set
    #
    # @return [Iterable::Response] A response object
    sig do
      params(
        name: String,
        template_id: Integer,
        list_ids: Array,
        attrs: Hash
      ).returns(Iterable::Response)
    end
    def create(name, template_id, list_ids = [], attrs = {})
      body = attrs.merge(name: name, templateId: template_id, listIds: list_ids)
      Iterable.request(conf, '/campaigns/create').post(body)
    end

    ##
    #
    # Get recurring child campaigns for a campaign
    #
    # @param campaign_id [Integer] Root campaign ID to get child recurring campaigns for
    #
    # @return [Iterable::Response] A response object
    sig { params(campaign_id: Integer).returns(Iterable::Response) }
    def recurring(campaign_id)
      Iterable.request(conf, "/campaigns/recurring/#{campaign_id}/childCampaigns").get
    end

    ##
    #
    # Export metrics in CSV format for one or more campaigns
    #
    # @param campaign_ids [Array] An array of campaign ids, must have at least one
    # @param start_time [Date|Time] Start of metrics to query for
    # @param end_time [Date|Time] End of metrics to query for
    #
    # @return [Iterable::Response] A response object
    sig do
      params(
        campaign_ids: Array,
        start_time: T.nilable(T.any(Date, Time)),
        end_time: T.nilable(T.any(Date, Time))
      ).returns(Iterable::Response)
    end
    def metrics(campaign_ids = [], start_time = nil, end_time = nil)
      params = { campaignId: campaign_ids }
      params[:startTime] = start_time.to_date.strftime(Iterable::DATE_FORMAT) if start_time
      params[:endTime] = end_time.to_date.strftime(Iterable::DATE_FORMAT) if end_time
      Iterable.request(conf, '/campaigns/metrics', params).get
    end
  end
end
