module Sass::Script::Functions
  def get_custom_palette
    color = Sass::Script::Value::Color.from_hex(options[:custom][:color])

    factor = Sass::Script::Value::Number.new(20, '%')

    palette = [lighten(color, factor), darken(color, factor), color]

    Sass::Script::Value::List.new(palette, :space)
  end
end
