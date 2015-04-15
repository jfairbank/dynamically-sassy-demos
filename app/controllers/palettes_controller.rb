class PalettesController < ApplicationController
  def index
  end

  def custom_palette
    color = params[:custom_color].paint.to_hex
    custom_renderer = SassCustomPalette.new(color)
    @css = custom_renderer.render
  end
end
