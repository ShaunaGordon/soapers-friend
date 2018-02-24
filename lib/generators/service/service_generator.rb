# Generate a Service class
class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_service_file
    empty_directory 'app/services'
    template 'service.rb.tt',
             File.join('app/services', class_path, "#{file_name}_service.rb")
  end

  hook_for :test_framework
end
