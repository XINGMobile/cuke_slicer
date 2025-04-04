Basic stuff:
[![Gem Version](https://badge.fury.io/rb/cuke_slicer.svg)](https://rubygems.org/gems/cuke_slicer)
[![Project License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/mit-license.php)
[![Downloads](https://img.shields.io/gem/dt/cuke_slicer.svg)](https://rubygems.org/gems/cuke_slicer)

User stuff:
[![Yard Docs](http://img.shields.io/badge/Documentation-API-blue.svg)](https://www.rubydoc.info/gems/cuke_slicer)

Developer stuff:
[![Build Status](https://github.com/enkessler/cuke_slicer/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/enkessler/cuke_slicer/actions/workflows/ci.yml?query=branch%3Amaster)
[![Coverage Status](https://coveralls.io/repos/github/enkessler/cuke_slicer/badge.svg?branch=master)](https://coveralls.io/github/enkessler/cuke_slicer?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/14c5ad2f8583be273418/maintainability)](https://codeclimate.com/github/enkessler/cuke_slicer/maintainability)
[![Inline docs](http://inch-ci.org/github/enkessler/cuke_slicer.svg?branch=master)](https://inch-ci.org/github/enkessler/cuke_slicer)

---


# CukeSlicer

The cuke_slicer gem provides an easy and programmatic way to divide a Cucumber test suite into granular test
cases that can then be dealt with on an individual basis. Often this means handing them off to a distributed
testing system in order to parallelize test execution.

## Installation

Add this line to your application's Gemfile:

    gem 'cuke_slicer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cuke_slicer

## Usage

    require 'cuke_slicer'


    # Choose which part of your test suite that you want to slice up
    test_directory = 'path/to/your_test_directory'

    # Choose your slicing filters
    filters = {excluded_tags: ['@tag1','@tag2'],
               included_tags: '@tag3',
               excluded_paths: 'foo',
               included_paths: [/test_directory/]}

    # Use the slicer to find all tests matching those filters
    found_tests = CukeSlicer::Slicer.new.slice(test_directory, filters, :file_line)


    # Arrange the sliced pieces to suit your particular needs. In this case, we will dump them
    # into a file that Cucumber can consume.

    File.open('tests_to_run.txt', 'w') { |file| file.puts found_tests }

    system('cucumber @tests_to_run.txt')


## Development and Contributing

See [CONTRIBUTING.md](https://github.com/enkessler/cuke_slicer/blob/master/CONTRIBUTING.md)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).




## Release

### Release Gem

Follow [Configure JFROG for Ruby](https://fantastic-couscous-zwrnp14.pages.github.io/getting-started/configurations/jfrog-ruby#) Documentation.

### (Legacy) Release Tag

In order to have your changes available you need to:

- Create a Pull Request that include below changes (or aggregate them with your changes)
  - Bump the version in `lib/cuke_slicer/version.rb` (try to follow [semantic versioning](https://semver.org))
  - Run `bundle` (which will regenerate the `Gemfile.lock`)
- Get the Pull Request approved and merged.
- Create and Publish the new tag based on the version by:
  - Switching locally to `main` branch and pulling the update version that was merged above
  - Run `bundle exec rake tags:create`.

Now you will be able to update the needed tag in the repositories needing it.
