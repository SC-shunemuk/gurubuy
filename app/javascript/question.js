window.addEventListener("load", function(){
  const pullDownButton = document.getElementById("question")
  const pullDownParents = document.getElementById("tooltip")
  pullDownButton.addEventListener('mouseover',function(){
    pullDownParents.setAttribute("style", "display:block;")
  })
  pullDownButton.addEventListener('mouseout', function(){
    pullDownParents.removeAttribute("style", "display:block;")
  })
})