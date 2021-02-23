namespace 'cuke_slicer' do

  desc 'Check that things look good before trying to release'
  task :prerelease_check do
    puts Rainbow('Checking that gem is in a good, releasable state...').cyan

    Rake::Task['cuke_slicer:full_check'].invoke
    Rake::Task['cuke_slicer:check_dependencies'].invoke

    puts Rainbow("I'd ship it. B)").green
  end

end
