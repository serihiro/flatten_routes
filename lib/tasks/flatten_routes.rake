require 'flatten_routes'

namespace :flatten_routes do
  desc 'Convert routes.rb to not using resource style. The original routes definitions will remain as comment.'
  task convert: :environment do
    routes = FlattenRoutes::Util.routes_from_rails_application
    new_routes_definition = FlattenRoutes::Util.generate_flatten_routes(routes)
    new_routes_definition = FlattenRoutes::Util.add_magic_comment(new_routes_definition.join("\n"))

    file_name = File.join(Rails.root, 'config', 'routes.rb')
    original_content = File.read(file_name)

    matched = FlattenRoutes::Util::ROUTES_CONTENT_PATTERN.match(original_content)
    exit unless matched

    original_routes_definition = matched[2]
    # delete old generated routes definition by flatten_routes
    original_routes_definition = FlattenRoutes::Util.delete_flatten_routes_definition(original_routes_definition)

    # comment out original definition
    original_routes_definition = original_routes_definition.split("\n").map do
      |line| %r{(^#|^\s*?#)}.match(line) ? line : "##{line}"
    end.join("\n")
    new_content = original_content.gsub(FlattenRoutes::Util::ROUTES_CONTENT_PATTERN,
                                        "\\1#{new_routes_definition + original_routes_definition}\\3")
    File.open(file_name, 'wb') { |f| f.puts(new_content) }
  end

  desc 'Annotate routes.rb'
  task annotate: :environment do
    routes = FlattenRoutes::Util.routes_from_rails_application
    new_routes_definition = FlattenRoutes::Util.generate_flatten_routes(routes)
    new_routes_definition = FlattenRoutes::Util.commentnize(new_routes_definition)
    new_routes_definition = FlattenRoutes::Util.add_magic_comment(new_routes_definition.join("\n"))

    file_name = File.join(Rails.root, 'config', 'routes.rb')
    original_content = File.read(file_name)

    matched = FlattenRoutes::Util::ROUTES_CONTENT_PATTERN.match(original_content)
    exit unless matched

    original_routes_definition = matched[2]
    # delete old generated routes definition by flatten_routes
    original_routes_definition = FlattenRoutes::Util.delete_flatten_routes_definition(original_routes_definition)
    new_content = original_content.gsub(FlattenRoutes::Util::ROUTES_CONTENT_PATTERN,
                                        "\\1#{new_routes_definition + original_routes_definition}\\3")
    File.open(file_name, 'wb') { |f| f.puts(new_content) }
  end
end
