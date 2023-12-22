module ApplicationHelper
  def display_model_errors(model)
    render partial: "shared/model_errors", locals: { model: model }
  end
end
