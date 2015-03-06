class BasePresenter
  def initialize(view_context)
    @view_context = view_context
  end

  def h
    @view_context
  end
end
