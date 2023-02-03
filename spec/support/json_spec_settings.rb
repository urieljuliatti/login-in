# frozen_string_literal: true

JsonSpec.configure do
  exclude_keys 'created_at', 'updated_at'
end

def json_exclude_keys(json)
  json.delete('created_at')
  json.delete('updated_at')
  json
end
