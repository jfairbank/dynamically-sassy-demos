class SassCustomPalette
  TEMPLATE = <<-EOS.freeze
    $palette: get-custom-palette();
    @import 'my-ui';
  EOS

  def initialize(color)
    @color = color
  end

  def render
    Sass::Engine.new(TEMPLATE, sass_custom_options).render
  end

  private

  def load_paths
    root = Rails.root.join('app', 'assets', 'stylesheets')
    Dir[root.join('includes')]
  end

  def sass_custom_options
    { syntax: :scss,
      style: :expanded,
      load_paths: load_paths,
      custom: { color: @color } }
  end
end
