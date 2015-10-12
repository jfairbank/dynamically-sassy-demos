(() => {
  const $ = document.querySelector.bind(document);
  const URL = '/palettes/custom_palette.css';
  let paletteLink = null;

  function getColor() {
    return $('#custom-color').value.trim();
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

  document.addEventListener('DOMContentLoaded', () => {
    $('#submit').addEventListener('click', setStylesheet);

    $('#custom-color').addEventListener('keyup', e => {
      if (e.keyCode === 13) {
        setStylesheet();
      }
    });

    $('#palette-selector').addEventListener('change', e => {
      document.body.className = `palette-${e.target.value}`;
    });
  });
})();
