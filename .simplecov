SimpleCov.start 'rails' do
  add_filter "/app/channels"
  add_filter "/app/helpers/"
  add_filter "/app/jobs/"
  add_filter "/app/models/application_record"
  add_filter "/app/controllers/application_controller"

  SimpleCov.minimum_coverage 90
end
