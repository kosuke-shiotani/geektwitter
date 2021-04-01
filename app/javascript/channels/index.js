// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.onload = () => {

  class Confirm {
    constructor(el) {
      this.message = el.getAttribute('data-confirm')
      if (this.message) {
        el.form.addEventListener('submit', this.confirm.bind(this))
      } else {
        console && console.warn('No value specified in `data-confirm`', el)
      }
    }

    confirm(e) {
      if (!window.confirm(this.message)) {
        e.preventDefault();
      }
    }
  }

  Array.from(document.querySelectorAll('[data-confirm]')).forEach((el) => {
    new Confirm(el)
  })

}