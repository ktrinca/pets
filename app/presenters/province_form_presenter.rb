class ProvinceFormPresenter < BasePresenter
  def provinces
    Province.sorted
  end
end