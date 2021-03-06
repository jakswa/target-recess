# frozen_string_literal: true

class Teepee
  BASE_URI = "https://#{ENV.fetch('TP_DOMAIN')}"
  MY_UNFINAL = '?AssignedUser.Where(it is Me) and EntityState.IsFinal != True'
  BASIC_SELECT = '{id,name,lastCommentDate,comments:{comments.count()},resourceType,entity_state:{EntityState.name}}'
  DETAILED_SELECT = '{id,name,resourceType,description,comments:comments.Select({id,description,createDate,owner})}'

  def initialize(token)
    @token = token
  end

  def my_stuff
    res = get_json '/api/v2/Assignable',
      filter: MY_UNFINAL,
      select: BASIC_SELECT
    res['items']
  end

  def entity(id)
    res = get_json "/api/v2/Assignable/#{id}", select: DETAILED_SELECT
    res['items']&.first
  end

  private

  def get_json(path, params = nil)
    uri = "#{BASE_URI}#{path}?#{default_params}"
    uri << "&#{params.to_param}" unless params.nil?
    JSON.parse(Net::HTTP.get(URI(uri)))
  end

  def default_params
    @default_params ||= { access_token: @token }.to_param
  end
end
