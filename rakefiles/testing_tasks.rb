namespace 'cuke_slicer' do

  desc 'Run all of the RSpec tests'
  task :run_rspec_tests => [:clear_old_results] do # rubocop:disable Style/HashSyntax
    puts Rainbow('Running RSpec tests...').cyan
    completed_process = CukeSlicer::CukeSlicerHelper.run_command(['bundle', 'exec', 'rspec',
                                                                  '--pattern', './testing/rspec/spec/**/*_spec.rb',
                                                                  '--require', './testing/rspec/spec_helper.rb'])

    raise(Rainbow('RSpec tests encountered problems!').red) unless completed_process.exit_code.zero?

    puts Rainbow('All RSpec tests passing.').green
  end

  desc 'Run all of the Cucumber tests'
  task :run_cucumber_tests => [:clear_old_results] do # rubocop:disable Style/HashSyntax
    puts Rainbow('Running Cucumber tests...').cyan
    completed_process = CukeSlicer::CukeSlicerHelper.run_command(%w[bundle exec cucumber])

    raise(Rainbow('Cucumber tests encountered problems!').red) unless completed_process.exit_code.zero?

    puts Rainbow('All Cucumber tests passing.').green
  end

  desc 'Run all of the tests'
  task :test_everything => [:clear_old_results] do # rubocop:disable Style/HashSyntax
    puts Rainbow('Running tests...').cyan

    Rake::Task['cuke_slicer:run_rspec_tests'].invoke
    Rake::Task['cuke_slicer:run_cucumber_tests'].invoke

    puts Rainbow('All tests passing!').green
  end

end
