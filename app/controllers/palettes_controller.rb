class PalettesController < ApplicationController
  def index
  end

  def custom
    color = params[:color].paint.to_hex
    custom_renderer = SassCustomPalette.new(color)
    @css = custom_renderer.render
  end
end
