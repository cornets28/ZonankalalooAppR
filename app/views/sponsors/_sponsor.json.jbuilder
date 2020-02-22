# frozen_string_literal: true

json.extract! sponsor, :id, :image, :created_at, :updated_at
json.url sponsor_url(sponsor, format: :json)
