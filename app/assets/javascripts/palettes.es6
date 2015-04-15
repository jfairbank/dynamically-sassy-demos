$(() => {
  const URL = '/palettes/custom_palette.css';
  let paletteLink = null;

  function getColor() {
    return $('#custom-color').val().trim();
  }

  function setStylesheet() {
    const color = getColor();

    if (!color) {
      return;
    }

    const url = `${URL}?custom_color=${encodeURIComponent(color)}`;
    const link = document.createElement('link');

    link.setAttribute('rel', 'stylesheet');
    link.setAttribute('media', 'all');
    link.setAttribute('href', url);

    if (paletteLink) {
      paletteLink.remove();
    }

    paletteLink = link;
    document.head.appendChild(link);
  }

  $('#submit').on('click', setStylesheet);
  $('#custom-color').on('keyup', function(e) {
    if (e.keyCode === 13) {
      setStylesheet();
    }
  })
});
