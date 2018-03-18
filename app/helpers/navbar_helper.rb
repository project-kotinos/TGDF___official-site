# frozen_string_literal: true

module NavbarHelper
  def current_path_under?(path)
    path = url_for(path)
    return false if path == root_path && request_path != path
    uri = URI(path)
    current_path_match?(uri) && current_params_under?(uri)
  end

  def current_path_match?(uri)
    return request_path.start_with?(uri.path) if params[:id].present?
    request_path == uri.path
  end

  def current_params_under?(uri)
    (URI.decode_www_form(uri.query || '') - request.params.to_a).empty?
  end

  def nav_item(name, path, options = {})
    style = []
    style << 'current' if current_path_under?(path)
    content_tag :li, class: style.join(' ') do
      link_to name, path, options
    end
  end

  private

  def request_path
    request.path.sub(%r{#{I18n.default_locale.to_s}[\/]?}, '')
  end
end
