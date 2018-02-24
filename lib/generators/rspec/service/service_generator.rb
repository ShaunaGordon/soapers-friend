require 'generators/rspec'

module Rspec
  module Generators
    # Generate a Service RSpec class
    class ServiceGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def create_service_spec
        empty_directory 'spec/services'
        template 'spec.rb.tt',
                 File.join('spec/services', class_path, "#{file_name}_spec.rb")
      end

      hook_for :test_framework
    end
  end
end
