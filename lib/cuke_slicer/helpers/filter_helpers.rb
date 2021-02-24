# Internal helper module that is not part of the public API. Subject to change at any time.
# :nodoc: all
module CukeSlicer
  # private
  module FilterHelpers

    include MatchingHelpers


    # private
    def apply_custom_filter(elements, &block)
      if block
        elements.reject! do |element|
          block.call(element)
        end
      end
    end

    # private
    def filter_excluded_tags(elements, filters)
      if filters
        filters = [filters] unless filters.is_a?(Array)

        unless filters.empty?
          elements.reject! do |element|
            matching_tag?(element, filters)
          end
        end
      end
    end

    # private
    def filter_included_tags(elements, filters)
      if filters
        filters = [filters] unless filters.is_a?(Array)

        elements.keep_if do |element|
          matching_tag?(element, filters)
        end
      end
    end

    # private
    def filter_excluded_paths(elements, filters)
      if filters
        filters = [filters] unless filters.is_a?(Array)

        elements.reject! do |element|
          matching_path?(element, filters)
        end
      end
    end

    # private
    def filter_included_paths(elements, filters)
      if filters
        filters = [filters] unless filters.is_a?(Array)

        unless filters.empty?
          elements.keep_if do |element|
            matching_path?(element, filters)
          end
        end
      end
    end

  end
end
