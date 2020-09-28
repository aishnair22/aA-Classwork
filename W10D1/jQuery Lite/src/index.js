const DOMNodeCollection = require("./dom_node_collection.js")

function $l(selector) {
    if (selector instanceof HTMLElement) {
        return new DOMNodeCollection([selector])
    } else {
        return Array.from(document.querySelectorAll(selector))
    }
}

window.$l = $l;

window.DOMNodeCollection = DOMNodeCollection