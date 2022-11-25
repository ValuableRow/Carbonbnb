// const alink = document.querySelector("#11");

//  alink.addEventListener('click', () => { console.log("hello"), alert('hello'); });
var clickEvent = new MouseEvent("click", {
    "view": window,
    "bubbles": true,
    "cancelable": false
});
window.addEventListener('load',function() { 
const myaccord = document.querySelector(`#${document.getElementById('accId').value} > button`);
if (myaccord != null) { myaccord.dispatchEvent(clickEvent); 
    document.querySelector(`#link_${document.getElementById('aHrefId').value}`).classList.remove("btn-secondary");
    document.querySelector(`#link_${document.getElementById('aHrefId').value}`).classList.add("btn-primary");
}
// });
// const allaccords = document.querySelectorAll(`#${document.getElementById('accId').value} > button`);