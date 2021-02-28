function pullDown(){
  const categories = document.getElementById("category");
  const pullDownParents = document.getElementById("pull-down");
  const pullDownChild = document.querySelectorAll(".list-name");

  categories.addEventListener('mouseover', function(){
    this.setAttribute("style", "font-weight:bold;");
  });
  categories.addEventListener('mouseout', function(){
    this.removeAttribute("style", "font-weight:bold;")
  });
  categories.addEventListener('click', function(){
    if (pullDownParents.getAttribute("style") == "display:block;"){
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    };
  });

  pullDownChild.forEach(function(list){
    list.addEventListener('mouseover', function() {
      list.setAttribute("style", "color:yellow;");
    });
    list.addEventListener('mouseout', function() {
      list.removeAttribute("style", "color:yellow;");
    });
  });
};
window.addEventListener('load', pullDown);