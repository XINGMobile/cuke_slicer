require "cuke_slicer/helpers/matching_helpers"
require "cuke_slicer/helpers/filter_helpers"
require "cuke_slicer/helpers/extraction_helpers"


# Internal helper module that is not part of the public API. Subject to change at any time.
# :nodoc: all
module CukeSlicer
  # private
  class FileExtractor

    include ExtractionHelpers


    # private
    def extract(target, filters, format, &block)
      Array.new.tap do |test_cases|
        unless target.feature.nil?
          tests = target.feature.tests

          runnable_elements = extract_runnable_elements(extract_runnable_block_elements(tests, filters, &block))

          runnable_elements.each do |element|
            case
              when format == :file_line
                test_cases << "#{element.get_ancestor(:feature_file).path}:#{element.source_line}"
              when format == :test_object
                test_cases << element
            end
          end
        end
      end
    end

  end
end
