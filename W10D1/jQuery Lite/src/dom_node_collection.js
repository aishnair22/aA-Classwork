class DOMNodeCollection {
    constructor(elements) {
        this.elements = elements;
    }

    html(str) {
        if (str) {
            this.innerHTML = str;
        } else {
            return this.elements[0].innerHTML
        }
    }

    empty() {
        this.elements.each(el => {
            el.html("");
        })
    }

    append(content) {
        this.elements.each(el => {
            el.innerHTML(content)
        })
    }

    attr(attr, val) {
        this.elements.each(el => el.setAttribute(attr, val));
    }

    addClass(newclass) {
        this.elements.each(el => el.classList.add(newclass));
    }

    removeClass(oldclass) {
        this.elements.each(el => el.classList.remove(oldclass));
    }

}

module.exports = DOMNodeCollection;