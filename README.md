# chef-reporting

## Overview

This gem contains an event handler for Chef that allows older (< 11.6.0)
version of chef to publish reporting information to Opscode Hosted Chef
or Opscode Private Chef.

## Manual Configuration

### Loading the gem
The `chef-reporting` gem is required to be loaded.  The easiest way is
to use the `chef_gem` resource to install the gem.


```ruby
chef_gem "chef-reporting" do
  action :install
end
```

### Enabling the gem in `client.rb`

The Event Handler should be configured in your `client.rb` to enable the
handler.

```ruby
begin
  require chef_reporting
  start_handlers << Chef::Reporting::StartHandler.new()
rescue LoadError
  Chef::Log.warn "Failed to load #{lib}. This should be resolved after a chef run."
end
```

## Configuration using the `chef-client` cookbook
The `chef-client` cookbook is able to automatically install and
configure gems used for start and event handlers:

```ruby
node.set['chef_client']['load_gems']['chef-reporting'] = {
    :require_name => 'chef_reporting',
    :action => :install
}

node.set['chef_client']['start_handlers'] = [
    {
        :class => "Chef::Reporting::StartHandler",
        :arguments => []
    }
]
include_recipe "chef-client::config"
```

## Licence and Author

Chef Reporting - A client library for Chef Reporting features

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **Author:**          | James Casey (<james@opscode.com>)
| **Copyright:**       | Copyright (c) 2012-2013 Opscode, Inc.
| **License:**         | Apache License, Version 2.0
