module ProjectsHelper
  def table_header(title, first: false)
    render partial: "projects/table_header", locals: {title: title, table_header_class: table_header_class(first) }
  end

  private

  def table_header_class(first)
    return "py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-0" if first

    "px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
  end
end
