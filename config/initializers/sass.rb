module Sass::Script::Functions
  def get_custom_palettes
    color = Sass::Script::Value::Color.from_hex(
      options[:custom][:color]
    )

    palettes = 3.times.map do |n|
      factor = Sass::Script::Value::Number.new(
        (n + 1) * 10, '%'
      )

      Sass::Script::Value::Map.new({
        Sass::Script::Value::String.new('bg') => lighten(color, factor),
        Sass::Script::Value::String.new('text') => darken(color, factor),
        Sass::Script::Value::String.new('original') => color
      })
    end

    Sass::Script::Value::List.new(palettes, :space)
  end
end
