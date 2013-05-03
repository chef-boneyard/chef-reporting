#
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
require 'chef/rest'
require 'chef/version_constraint'


class Chef
  class Reporting
    class StartHandler < ::Chef::Handler

      attr_reader :config

      def initialize(config={})
        @config = config
      end

      def report
        version_checker = Chef::VersionConstraint.new("< 11.6.0")
        if version_checker.include?(Chef::VERSION)
          Chef::Log.info("Enabling backported resource reporting Handler")
          rest = Chef::REST.new(Chef::Config[:chef_server_url], @run_status.node.name, Chef::Config[:client_key])
          resource_reporter = Chef::Reporting::ResourceReporter.new(rest)
          @run_status.events.register(resource_reporter)

          resource_reporter.run_started(@run_status)
        else
          Chef::Log.debug("Chef Version already has new Resource Reporter - skipping startup of backport version")
        end
      end
    end
  end
end
