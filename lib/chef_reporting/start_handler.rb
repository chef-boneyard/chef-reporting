#
# Author:: James Casey (<james@opscode.com>)
# Copyright:: Copyright (c) 2013 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/handler'

class Chef
  class Reporting
    class StartHandler < ::Chef::Handler

      attr_reader :config

      def initialize(config={})
        @config = config
      end

      def report
        Chef::Log.error("Enabling Reporting Handler")
        @rest = Chef::REST.new(config[:chef_server_url], config[:node_name], config[:client_key])

        # TODO - This doesn't work since it's too late
        @resource_reporter = Chef::Reporting::ResourceReporter.new(@rest)
        Chef::Config[:event_handlers] << @resource_reporter

        Chef::Config
      end

    end
  end
end