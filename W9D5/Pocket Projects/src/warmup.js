const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    let paragraph = document.createElement("p")
    paragraph.innerText = string;
    if (htmlElement.firstChild){
        Array.from(htmlElement.children).forEach((child) =>{
            child.remove();
        });
    }
    htmlElement.append(paragraph);
};

htmlGenerator('Party Time.', partyHeader);
// htmlGenerator('I <3 Vanilla DOM Manipulation!', partyHeader);
