// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"
import Chart from "chart.js/auto"
import "flowbite";
import 'flowbite-datepicker';

let Hooks = {}; // this may already be here

Hooks.LogoutButton = {
  mounted() {
    this.handleEvent("logout", () => {
      let btn = document.getElementById("logout-button");
      if (btn) btn.click();
    });
  }
};

Hooks.AutoScroll = {
  updated() {
    window.scrollTo({ top: document.body.scrollHeight, behavior: "smooth" });
  }
};

Hooks.DropdownToggle = {
  mounted() {
    const button = this.el
    const dropdown = document.getElementById(this.el.dataset.target)

    const transitionDuration = 200 // match your CSS duration in ms

    const closeDropdown = () => {
      dropdown.classList.remove("scale-y-100", "opacity-100")
      dropdown.classList.add("scale-y-0", "opacity-0")
      dropdown.setAttribute("aria-hidden", "true")
      button.setAttribute("aria-expanded", "false")

      // Delay hiding until animation ends
      setTimeout(() => {
        if (!dropdown.classList.contains("scale-y-100")) {
          dropdown.classList.add("hidden")
        }
      }, transitionDuration)
    }

    const openDropdown = () => {
      dropdown.classList.remove("hidden")
      // Allow browser to register the removal of `hidden`
      requestAnimationFrame(() => {
        dropdown.classList.remove("scale-y-0", "opacity-0")
        dropdown.classList.add("scale-y-100", "opacity-100")
        dropdown.setAttribute("aria-hidden", "false")
        button.setAttribute("aria-expanded", "true")
      })
    }

    button.addEventListener("click", () => {
      const expanded = dropdown.classList.contains("scale-y-100")
      if (expanded) {
        closeDropdown()
      } else {
        openDropdown()
      }
    })

    // Close when tabbing out
    dropdown.addEventListener("focusout", () => {
      setTimeout(() => {
        if (!dropdown.contains(document.activeElement)) {
          closeDropdown()
        }
      }, 50)
    })

    // Close when clicking outside
    document.addEventListener("click", (e) => {
      const clickedOutside = !dropdown.contains(e.target) && !button.contains(e.target)
      const isOpen = dropdown.classList.contains("scale-y-100")
      if (isOpen && clickedOutside) {
        closeDropdown()
      }
    })
  }
}

window._live_charts = [];

Hooks.Chart = {
  mounted() {
    this.renderChart();
    this._onThemeChange = () => this.renderChart();
    window.addEventListener("theme-changed", this._onThemeChange);

    window._live_charts.push(this);
  },

  destroyed() {
    if (this._onThemeChange) {
      window.removeEventListener("theme-changed", this._onThemeChange);
    }

    const index = window._live_charts.indexOf(this);
    if (index > -1) {
      window._live_charts.splice(index, 1);
    }

    if (this.el._chart) {
      this.el._chart.destroy();
    }
  },

  updated() {
    this.renderChart();
  },

  renderChart() {
    const config = JSON.parse(this.el.dataset.config);
    const isDark = document.documentElement.classList.contains("dark");
    const textColor = isDark ? "#fff" : "#000";

    if (!config.options) config.options = {};
    if (!config.options.plugins) config.options.plugins = {};
    if (!config.options.scales) config.options.scales = {};

    config.options.plugins.legend = {
      ...config.options.plugins.legend,
      labels: {
        color: textColor
      }
    };

    config.options.plugins.title = {
      ...config.options.plugins.title,
      color: textColor
    };

    config.options.scales.y = {
      ...config.options.scales.y,
      ticks: {
        ...config.options.scales.y?.ticks,
        color: textColor
      },
      title: {
        ...config.options.scales.y?.title,
        color: textColor
      }
    };

    config.options.scales.x = {
      ...config.options.scales.x,
      ticks: {
        ...config.options.scales.x?.ticks,
        color: textColor
      },
      title: {
        ...config.options.scales.x?.title,
        color: textColor
      }
    };

    // If a chart instance already exists on this element, destroy it first
    if (this.el._chart) {
      this.el._chart.destroy();
    }

    // Create a new chart instance
    this.el._chart = new Chart(this.el.getContext("2d"), config);
  }
}


let liveSocketPath = process.env.NODE_ENV === "production" ? "/csci379-25s-a/live" : "/live";

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket(liveSocketPath, Socket, {
  //longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken},
  hooks: Hooks
})


// adds or removes the 'dark' class from <html> based on the `theme` in localStorage,
// if given, or default preference otherwise.
function set_theme() {
  if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    document.documentElement.classList.add('dark')
  } else {
    document.documentElement.classList.remove('dark')
  }
}

// Exposes function to toggle dark mode on and off.
window.toggleDarkMode = () => {
  if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    localStorage.theme = 'light'
  } else {
    localStorage.theme = 'dark'
  }
  set_theme()

  window.dispatchEvent(new Event("theme-changed"));

  if (window._live_charts) {
    window._live_charts.forEach(hook => hook.renderChart());
  }
}

// set theme on page load
set_theme()

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
