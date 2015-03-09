class BaseController < ApplicationController
  respond_to :json, :html, :csv
end
