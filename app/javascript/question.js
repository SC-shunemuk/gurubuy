window.addEventListener("load", function(){
  const pullDownButton = document.getElementById("question1")
  const pullDownParents = document.getElementById("tooltip1")
  const pullDown = document.getElementById("question2")
  const pullout = document.getElementById("tooltip2")
  const pushDown = document.getElementById("question3")
  const pushOut = document.getElementById("tooltip3")
  
  pullDownButton.addEventListener('mouseover',function(){
    pullDownParents.setAttribute("style", "display:block;")
  })
  pullDownButton.addEventListener('mouseout', function(){
    pullDownParents.removeAttribute("style", "display:block;")
  })

  pullDown.addEventListener('mouseover',function(){
    pullout.setAttribute("style", "display:block;")
  })
  pullDown.addEventListener('mouseout',function(){
    pullout.removeAttribute("style", "display:block;")
  })

  pushDown.addEventListener('mouseover',function(){
    pushOut.setAttribute("style", "display:block;")
  })
  pushDown.addEventListener('mouseout',function(){
    pushOut.removeAttribute("style", "display:block;")
  })
  
})
