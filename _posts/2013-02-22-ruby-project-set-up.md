---
title: Ruby Project Set-up
---

If you have ever started a project from scratch, you have hit the following error:

{% highlight ruby linenos %}
irb(main):001:0> require 'asdfas'
LoadError: cannot load such file -- asdfas

irb(main):002:0> require 'my_project/asdfas'
LoadError: cannot load such file -- asdfas

irb(main):003:0> require 'my_project/asdfas.rb'
LoadError: cannot load such file -- my_project/asdfas.rb

irb(main):003:0> require File.join(File.expand_path('../../my_project/asdfas.rb', __FILE__))
LoadError: cannot load such file -- /Users/my_project/asdfas.rb
{% endhighlight %}

This problem was unique to 

But when starting a project 100% from scratch, or writing a sinatra app, I've often resorted
to require_relative or writing out exact paths.

What the what?

The other day, I began a project that I thought might become a gem. If you have
started projects from scratch, you are familiar with bundler's init and gem commands.

{% highlight bash %}
bundle init(1)
      Generate a simple Gemfile, placed in the current directory

bundle gem(1)
      Create a simple gem, suitable for development with bundler
{% endhighlight %}


## Bundle Gem

Bundler's gem command reveals how most ruby projects make requiring specific files easier.
The command generates a number of files based on the gem name. After running the gem command,
take a look at the first few lines of the gemspec:

{% highlight ruby linenos %}
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_ratings/version'
{% endhighlight %}

As soon as your gemspec is run, it prepends your project's lib folder the the load path. 

## Rail’s Boot