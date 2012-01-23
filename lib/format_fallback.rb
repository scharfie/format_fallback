require "format_fallback/version"

module ActionView
  class PathSet < Array
    def find_template_with_fallback(original_template_path, format = nil, html_fallback = true)
      debugger
      find_template_without_fallback(original_template_path, format, html_fallback)
    rescue MissingTemplate => exception
      raise exception if format == :html
      find_template_without_fallback(original_template_path, :html, html_fallback)
    end

    alias_method_chain :find_template, :fallback
  end
end
