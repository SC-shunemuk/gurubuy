window.addEventListener("load", function(){
  const categoryPulldown = document.getElementById("category-list")
  const categoryChildren = document.getElementById("category-hidden")

  categoryPulldown.addEventListener('click',function(){
    if (categoryChildren.getAttribute("style") == "display:block;") {
      categoryChildren.removeAttribute("style", "display:block;")
    } else {
      categoryChildren.setAttribute("style", "display:block;")
    }
  })
})