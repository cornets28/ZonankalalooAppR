# frozen_string_literal: true

json.extract! job, :id, :company, :job_title, :position, :description, :opening_date, :closingdate, :location, :created_at, :updated_at
json.url job_url(job, format: :json)
