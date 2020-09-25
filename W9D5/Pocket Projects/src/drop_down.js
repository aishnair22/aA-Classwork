
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

export function dogLinkCreator(){
  let links = [];
  Object.keys(dogs).forEach((dogName) => {
    let a = document.createElement("a");
    a.innerHTML = dogName;
    a.setAttribute("href", dogs[dogName]);
    let li = document.createElement("li");
    li.setAttribute("class", "dog-link");
    li.append(a);
    links.push(li);
  });
  return links;
}

export function attachDogLinks() {
  let dogLinks = dogLinkCreator();
  let ul = document.querySelector(".drop-down-dog-list")
  dogLinks.forEach(link => {
    ul.append(link);
  })
}

attachDogLinks()

function handleEnter(e){
  let links = document.querySelectorAll(".dog-link");
  let linksArray = Array.from(links)
  linksArray.forEach((link) => {
  // debugger
    link.style.display = "block"});  
}

function handleLeave(e) {
  let links = document.querySelectorAll(".dog-link");
  let linksArray = Array.from(links)
  linksArray.forEach((link) => {link.style.display = "none"});
}

export const heading = document.querySelector(".drop-down-dog-nav")
heading.addEventListener('mouseenter', handleEnter);
heading.addEventListener('mouseleave', handleLeave);
